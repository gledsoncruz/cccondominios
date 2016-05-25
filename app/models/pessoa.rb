class Pessoa < ActiveRecord::Base
  has_many :unidade_pessoas
  has_many :unidades, :through => :unidade_pessoas, :dependent => :destroy


  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_created_at_gte
    ]
  )

  scope :search_query, lambda { |query|

    return nil  if query.blank?

    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(pessoas.nome) LIKE ? OR LOWER(pessoas.nome) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    order("pessoas.created_at #{ direction }")
  when /^nome/
    order("LOWER(pessoas.nome) #{ direction }")
  when /^email/
    order("pessoas.email #{ direction }")
    #order("LOWER(countries.name) #{ direction }").includes(:country)
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

end

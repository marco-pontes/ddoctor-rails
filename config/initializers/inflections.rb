# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural 'perfil', 'perfis'
  inflect.singular 'perfis', 'perfil'
  inflect.plural 'mensagem', 'mensagens'
  inflect.singular 'mensagens', 'mensagem'
  inflect.plural 'consulta', 'consultas'
  inflect.plural 'consultas', 'consulta'
  inflect.plural 'plano_saude','planos_saude'
  inflect.plural 'medicacao', 'medicacoes'
  inflect.singular 'medicacoes', 'medicacao'
end


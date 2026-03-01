# Temporarily disabled to debug stack overflow issue
#
# module Jekyll
#   class CitationGenerator < Generator
#     priority :low

#     def generate(site)
#       return unless site.data.key?('publications')
#       publications = site.data['publications']
#       return unless publications.is_a?(Hash) && publications.key?('references')
#       publications['references'].each do |entry|
#         # citation generation code here
#       end
#     end
#   end
# end

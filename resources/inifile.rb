# To learn more about Custom Resources, see https://docs.chef.io/custom_resources/
provides :inifile
property :sensitive, [TrueClass, FalseClass], default: false
property :section, String
property :values, Hash, required: true
property :path, String, required: true, name_property: true

unified_mode true

action :edit do
  document = ::File.exist?(new_resource.path) ? IniParse.parse( ::File.read(new_resource.path) ) : IniParse::Document.new

  new_resource.values.each do |key, val|
    document.section(new_resource.section)[key] = val
  end

  declare_resource(:file, new_resource.name) do
    content document.to_ini
    path new_resource.path
    sensitive new_resource.sensitive
    action :create
  end
  
end
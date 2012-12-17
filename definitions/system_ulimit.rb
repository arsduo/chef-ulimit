# Defines a system_ulimit modification
# Sample:
#
# depends 'ulimit'
#
# system_ulimit "*" do
#  filehandle_limit 8192
#  process_limit 61504
# end

define :system_ulimit, :filehandle_limit => 4096, :process_limit => 61232 do
  template "/etc/security/limits.conf" do
    source "ulimit.erb"
    cookbook "chef-ulimit"
    owner "root"
    group "root"
    mode 0644
    variables(
      :ulimit_user => params[:name],
      :filehandle_limit => params[:filehandle_limit],
      :process_limit => params[:process_limit]
    )
  end
end


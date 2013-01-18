require "cap_cloud/version"

class CapCloud
  require 'fog'

  attr_accessor :compute
  
  def initialize(access_key_id, secret_access_key, region='ap-southeast-1')
    @compute = Fog::Compute.new({provider: 'AWS',
                                 aws_access_key_id: access_key_id,
                                 aws_secret_access_key: secret_access_key,
                                 region: region})
  end 

  def filter_active(servers)
    active_servers = []
    servers.each {|server| active_servers << server if server.state == "running"}
    active_servers
  end

  def active_by_name(name)
    filter_active(servers_by_name({"tag:Name" => name})).map(&:public_ip_address)
  end

  def active_by_tags(tags)
    filter_active(servers_by_tags(tags)).map(&:public_ip_address)
  end

  def servers_by_name(name)
    @compute.servers.all(name)
  end

  def servers_by_tags(tags)
    @compute.servers.all(tags)
  end
end


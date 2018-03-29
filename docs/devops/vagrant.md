## Useful links

[Vagrant boxes](https://app.vagrantup.com/boxes/search)

[Vagrant scp to copy files](https://github.com/invernizzi/vagrant-scp)

## Demo Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "consumerlab/ubuntu-server-16-04-LTS"
  config.vm.define "database_machine"
  config.vm.network "forwarded_port", guest: 80, host: 80

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.groups = {
      "database" => ["database_machine"]
    }
    ansible.extra_vars = {
      "some_var": "content"
    }
    ansible.raw_arguments = ["--ask-become-pass"]
  end
end
```

# usage:
# vi data.yml
# python ./render-telegraf-configuration.py -h
# python ./render-telegraf-configuration.py --help
# python ./render-telegraf-configuration.py --output 'configs/telegraf-openconfig.conf' --template 'templates/telegraf-openconfig.j2' --yaml 'data.yml'
# python ./render-telegraf-configuration.py -o 'configs/telegraf-openconfig.conf' -t 'templates/telegraf-openconfig.j2' -y 'data.yml'

import yaml
from jinja2 import Template
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-o', '--output', help='rendered file')
parser.add_argument('-t', '--template', help='jinja template file')
parser.add_argument('-y', '--yaml', help='YAML variables file')
args = parser.parse_args()

# Start building telegraf configuration'

with open(args.yaml) as f:
  data=yaml.load(f.read())

with open(args.template) as f:
  template = Template(f.read())

conf=open(args.output,'w')
conf.write(template.render(data))
conf.close()



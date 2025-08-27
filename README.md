# cr_inifile

Cooking Robot !

An utility cookbook to modify ini files.

This project is a part of Cooking Robot group.

## How to use

This cookbook only contain one resource: inifile.

Exemple:

```ruby
inifile 'test file' do
  sensitive false
  section 'ini_section'
  values ({
    param1: "value1",
    param2: "value2"
  })
  path '/tmp/inifile.ini'
```

This cookbook is multiplatform. For values, don't forget to use parenthesis to pass a hash instead of a block.

# Review Notes

## Startup

`db:create`, `migrate`, `seed` all worked.  Good job

## DB

###  template.rb

You can use a technology called a HERE document to tighten this up.

    @loose_text = <<-EOT
      i know you like it sweet,
      so you can have your cake
      give you something to celebrate
    EOT

### Good constraints in the DB

## Routes

Nicely constructed Routes.  It's exceptional to ask ApplicationController to
handle routing anything.  It's more like a parent class.

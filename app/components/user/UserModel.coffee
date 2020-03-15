import {Model} from "backbone"

export class UserModel extends Model

  validate: (attrs, options) ->
    if !attrs.name || attrs.name.trim() == ""
      return "Name can't be empty"
    if !attrs.phone || !attrs.phone.match(/^[+]?[-0-9]*$/i)
      return "Phone number is invalid"

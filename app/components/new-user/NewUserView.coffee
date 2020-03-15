import {View} from "backbone"
import "./new-user.less"
import {UserModel} from "../user/UserModel"
import UserService from "../../services/UserService"

export class NewUserView extends View
  template: require "./new-user.mustache"

  events: {
    "click #add-user": "submitUserFields"
  }

  submitUserFields: ->
    name = @$el.find('.new-user__name')[0].value
    phone = @$el.find('.new-user__phone')[0].value
    user = new UserModel {
      name: name,
      phone: phone
    }
    if !user.isValid()
      @renderError user.validationError
    else
      UserService.create(user)
      @render()

  render: ->
    @el.innerHTML = @template()

  renderError: (message) ->
    @$el.find("#error").text(message)
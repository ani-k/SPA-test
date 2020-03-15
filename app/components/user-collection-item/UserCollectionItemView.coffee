import {View} from "backbone"
import UserService from "../../services/UserService"
import {UserModel} from "../user/UserModel"

export class UserCollectionItemView extends View
  tagName: 'tr'
  className: 'user-table-body__row'
  template: require "./user-collection-item.mustache"

  events: {
    "click #edit" : "onEditClick"
    "click #save" : "onSaveClick"
    "click #remove" : "onRemoveClick"
  }

  initialize: ->
    @listenTo @model, "change:isEditMode", @render

  onEditClick: ->
    console.log "edit"
    @model.set "isEditMode", true

  onSaveClick: ->
    console.log "save"
    name = @$el.find('.user-name')[0].value
    phone = @$el.find('.user-phone')[0].value
    user = new UserModel {
      name: name,
      phone: phone
    }
    if !user.isValid()
      @renderError user.validationError
    else
      UserService.update(@model, name, phone)
      @model.set "isEditMode", false

  onRemoveClick: ->
    console.log "remove"
    UserService.remove(@model)

  render: ->
    @el.innerHTML = @template(@model.attributes)
    @el

  renderError: (message) ->
    @$el.find("#error").text(message)

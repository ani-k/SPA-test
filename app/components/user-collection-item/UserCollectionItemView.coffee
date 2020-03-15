import {View} from "backbone"

export class UserCollectionItemView extends View
  tagName: 'tr'
  className: 'user-table-body__row'
  template: require "./user-collection-item.mustache"

  events: {
    "click #edit" : "onEditClick"
    "click #save" : "onSaveClick"
  }

  initialize: ->
    @listenTo @model, "change:isEditMode", @render

  onEditClick: ->
    console.log "edit"
    @model.set "isEditMode", true

  onSaveClick: ->
    console.log "save"
    @model.set "isEditMode", false

  render: ->
    @el.innerHTML = @template(@model.attributes)
    @el


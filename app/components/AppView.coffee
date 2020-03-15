import * as Backbone from "backbone"
import {UserTableView} from "./user-table/UserTableView"
import "./app-view.less"
import {UserTableModel} from "./user-table/UserTableModel"

export class AppView extends Backbone.View

  template: require('./app-view.mustache')
  render: ->
    @el.innerHTML = @template(@model.attributes)
    userTableView = new UserTableView {
      el: @$el.find('#user-table')[0],
      model: new UserTableModel({
        userCollection: @model.get("userCollection")
      })
    }
    userTableView.render()
    @


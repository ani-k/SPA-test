import * as Backbone from "backbone"
import {UserTableView} from "./user-table/UserTableView"
import "./app-view.less"
import {UserTableModel} from "./user-table/UserTableModel"
import {NewUserView} from "./new-user/NewUserView"

export class AppView extends Backbone.View

  template: require('./app-view.mustache')

  render: ->
    @el.innerHTML = @template(@model.attributes)
    newUserView = new NewUserView {
      el: @$el.find('#new-user')[0],
    }
    newUserView.render()

    userTableView = new UserTableView {
      el: @$el.find('#user-table')[0],
      model: new UserTableModel({
        userCollection: @model.get("userCollection")
      })
    }
    userTableView.render()
    @

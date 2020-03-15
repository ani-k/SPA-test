import {View} from "backbone"
import "./user-table.less"
import {UserCollectionView} from "../../views/UserCollectionView"

export class UserTableView extends View
  template: require "./user-table-view.mustache"
  render: ->
    @el.innerHTML = @template()
    userCollectionView = new UserCollectionView {
      el: @$el.find('#user-table-body')[0],
      collection: @model.get("userCollection")
    }
    userCollectionView.render()


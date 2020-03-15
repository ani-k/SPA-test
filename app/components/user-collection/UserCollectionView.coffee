import {View} from "backbone"
import * as _ from "underscore"
import {UserCollectionItemView} from "../user-collection-item/UserCollectionItemView"

export class UserCollectionView extends View
  initialize: ->
    @listenTo @collection, "add", @renderItem
    @listenTo @collection, "remove", @render

  render: ->
    @$el.html("")
    _.each @collection.models, (it) ->
      @renderItem.call(this, it)
    , @
    @el

  renderItem: (it) ->
    itemView = new UserCollectionItemView {
      model: it
    }
    @el.append(itemView.render())

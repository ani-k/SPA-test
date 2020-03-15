import {View} from "backbone"
import * as _ from "underscore"
import {UserCollectionItemView} from "../components/user-collection-item/UserCollectionItemView"

export class UserCollectionView extends View

  render: ->
    _.each @collection.models, (it) ->
      itemView = new UserCollectionItemView {
        model: it
      }
      @el.append(itemView.render())
    , @
    @el

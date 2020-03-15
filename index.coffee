import {AppModel} from "./app/components/AppModel"
import {AppView} from "./app/components/AppView"
import {UserModel} from "./app/models/UserModel"
import {UserCollection} from "./app/collections/UserCollection"
import {UserCollectionView} from "./app/views/UserCollectionView"

import "./index.less"

###
  +1. Create user table package, add mustache, less, coffee for UserTableView
  2. Render in UserTableView an UserCollectionView
  3. Create user add view and render it in table view
###
console.log "1"

model = new AppModel {
  name: "world",
  userCollection: new UserCollection [
    {
      name: "Efim"
      phone: "777"
    },
    {
      name: "Ani"
      phone: "666"
    }
  ]
}


view = new AppView {
  model: model,
  el: document.getElementById('app')
}

view.render()

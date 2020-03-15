import {AppModel} from "./app/components/AppModel"
import {AppView} from "./app/components/AppView"
import {UserCollection} from "./app/components/user-collection/UserCollection"
import "./index.less"
import UserService from "./app/services/UserService"

model = new AppModel {
  name: "world",
  userCollection: new UserCollection [
    {
      name: "Efim"
      phone: "777"
      id: 1
    },
    {
      name: "Ani"
      phone: "666"
      id: 2
    }
  ]
}

maxId = 5

UserService.on "create", (user) ->
  user.set(id: maxId++)
  model.get("userCollection").add(user)

UserService.on "remove", (user) ->
  model.get("userCollection").remove(user)

view = new AppView {
  model: model,
  el: document.getElementById('app')
}

view.render()

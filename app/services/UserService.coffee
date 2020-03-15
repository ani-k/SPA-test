import * as _ from "underscore"
import {Events} from "backbone"

class UserService
  create: (userModel) ->
    console.log "saveToServer"
    @trigger("create", userModel)

  remove: (userModel) ->
    console.log "removeUser"
    @trigger("remove", userModel)

  update: (userModel, name, phone) ->
    console.log "update"
    userModel.set {
      name: name,
      phone: phone
    }
    @trigger("update", userModel)

export default _.extend(new UserService(), Events)

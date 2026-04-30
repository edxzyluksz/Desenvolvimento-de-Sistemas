import { QuitandaModel } from "./model/QuitandaModel.js"
import { QuitandaView } from "./view/QuitandaView.js"
import { QuitandaController } from "./controller/QuitandaController.js"

const model = new QuitandaModel()
const view = new QuitandaView()
const controller = new QuitandaController()

controller.init(model, _, view)
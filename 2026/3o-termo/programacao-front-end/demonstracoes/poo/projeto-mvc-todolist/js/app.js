// Adicioanr os imports

import { TaskModel } from "./model/TaskModel.js";
import { TaskView } from "./view/TaskView.js";
import { TaskController } from "./controller/TaskController.js";

const model = new TaskModel()
const view = new TaskView()
const controller = new TaskController(model, view)

controller.init()
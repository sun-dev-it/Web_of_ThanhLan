import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@rails/webpacker"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

const Webpacker = "Hello. i'm Webpacker"
console.log(Webpacker);

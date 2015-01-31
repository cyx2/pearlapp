# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(() -> $("#button0").click(() -> $("#overall").show() $("#professor").hide() $("#assignments").hide() $("#overallLI").addClass("active") $("#professorLI").removeClass("active") $("#assignmentsLI").removeClass("active") ))

$(document).ready(() -> $("#button1").click(() -> $("#professor").show() $("#overall").hide() $("#assignments").hide() $("#professorLI").addClass("active") $("#overallLI").removeClass("active") $("#assignmentsLI").removeClass("active") ))

$(document).ready(() -> $("#button2").click(() -> $("#assignments").show() $("#professor").hide() $("#overall").hide() $("#assignmentsLI").addClass("active") $("#professorLI").removeClass("active") $("#overallLI").removeClass("active") ))

$(document).ready(() -> $("#overall").show() $("#professor").hide() $("#assignments").hide())
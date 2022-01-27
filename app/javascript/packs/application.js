// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// import { jobDisplay } from 'controllers/display_jobs';
import { userInfoDisplay } from "../controllers/display_user_info";
import { initChatroomCable } from '../channels/chatroom_channel';
import { swipeOffer } from '../plugins/swipe';
import { notificationTest } from '../controllers/notif';
import { initSelect2 } from '../controllers/selectjob';
 import { jobClick } from '../controllers/seehideform';
 import {jobClickSkill} from '../controllers/seehide';

document.addEventListener('turbolinks:load', () => {


  // Call your functions here, e.g:
  // testAnim()
  userInfoDisplay()
  swipeOffer()

  // loic
  initChatroomCable()
  notificationTest()
  jobClick()
  jobClickSkill()
  initSelect2()

  // disable pinch-zoom on smartphone -------------------------
  document.addEventListener('gesturestart', function(e) {
      e.preventDefault();
      // special hack to prevent zoom-to-tabs gesture in safari
      document.body.style.zoom = 0.99;
  });

  document.addEventListener('gesturechange', function(e) {
      e.preventDefault();
      // special hack to prevent zoom-to-tabs gesture in safari
      document.body.style.zoom = 0.99;
  });

  document.addEventListener('gestureend', function(e) {
      e.preventDefault();
      // special hack to prevent zoom-to-tabs gesture in safari
      document.body.style.zoom = 0.99;
  });

  // initSelect2();
});

import "controllers"

import { Application, Controller } from './Stimulus.js';
const StimulusApp = Application.start()

let infinityCoreController;
StimulusApp.register("framework", class extends Controller {

    connect(){
        infinityCoreController = this;
    }

    hudCoreRefreshing(PlayerDatas){

        // PlayerDataSession
       // console.log(JSON.stringify(PlayerDatas.session, null, 2));

        // Thirst
        document.getElementById('water').innerHTML = `<div class="progress drink_jauge">
            <div class="progress-bar" role="progressbar" style="width: ${parseFloat(PlayerDatas.water).toFixed(0)}%;" aria-valuenow="${parseFloat(PlayerDatas.water).toFixed(0)}" aria-valuemin="0" aria-valuemax="100">
                <span class="icon_water"></span>
            </div>
        </div>`;

        // Food
        document.getElementById('eat').innerHTML = `<div class="progress eat_jauge">
            <div class="progress-bar" role="progressbar" style="width: ${parseFloat(PlayerDatas.eat).toFixed(0)}%;" aria-valuenow="${parseFloat(PlayerDatas.eat).toFixed(0)}" aria-valuemin="0" aria-valuemax="100">
                <span class="icon_eat"></span>
            </div>
        </div>`;

        // HP
        document.getElementById('hp').innerHTML = `<div class="progress hp_jauge">
            <div class="progress-bar" role="progressbar" style="width: ${parseFloat(PlayerDatas.hp).toFixed(0)}%;" aria-valuenow="${parseFloat(PlayerDatas.hp).toFixed(0)}" aria-valuemin="0" aria-valuemax="100">
                <span class="icon_health"></span>
            </div>
        </div>`;
        
        // Temperature in degres
        if(document.getElementById('degres')){
            document.getElementById('degres').innerHTML = `${parseFloat(PlayerDatas.temperature).toFixed(0)}°`;
        }
        // ID Player 
        if(document.getElementById('idplayer')){
            document.getElementById('idplayer').innerHTML = `ID ${PlayerDatas.session._InfinitySource}`;
        }
        // KillCounter 
        if(document.getElementById('kill')){
            document.getElementById('kill').innerHTML = `${PlayerDatas.kill} Kills`;
        }
        // Cash
        if(document.getElementById('cash')){
            document.getElementById('cash').innerHTML = `${PlayerDatas.session._Cash}$`;
        }
        // Golds
        if(document.getElementById('golds')){
            document.getElementById('golds').innerHTML = `${PlayerDatas.session._Gold}g`;
        }
        // XP
        if(document.getElementById('xp')){
            document.getElementById('xp').innerHTML = `${PlayerDatas.session._Xp}xp`;
        }

        //this.openPart('roleplayjob')
    }

    openPart(partName){
        fetch(`/html/parts/${partName}.html`,{
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`error: ${response.status}`);
            }
            return response.text();
        })
        .then(data => {
            document.getElementById('showPart').innerHTML = data;
        })
        .catch(error => {
            console.error('error request:', error);
        });
    }
})

/**
 * WHEEL ACTION
 */
let infinityCoreActionsController;
StimulusApp.register("frameworkactions", class extends Controller {
    connect(){
        infinityCoreActionsController = this;
    }
    closeActionWheel(){
      fetch(`https://${GetParentResourceName()}/close`);
    }
})

/**
 * NOTIFICATION CORE
 */
function SendNotification(data) {
    function sleep(ms) {return new Promise(resolve => setTimeout(resolve, ms));}
    document.querySelector('.notifications').innerHTML = '';
    var notification        = document.createElement('div')
    notification.className  = 'notification '+data.position+" "+data.design+" animate__animated  animate__fadeIn";
    var title       = document.createElement('div');
    title.className = 'title';
    title.innerHTML = data.title;
    notification.appendChild(title);
    if (data.text) {
        var text        = document.createElement('div');
        text.className  = 'text';
        text.innerHTML  = data.text;
        notification.appendChild(text);
    }
    var notifications   = document.querySelector('.notifications')
    notifications.appendChild(notification)
    if(data.duration > 0){
        setTimeout(function() {
            notification.className  = 'notification '+data.position+" "+data.design+" animate__animated  animate__fadeOut";
            sleep(data.duration);
        }, data.duration);
    }
}

/**
 * CORE PROCESS
 */
window.addEventListener('message', function(event) {
    let actionRedM = event.data;
    if (actionRedM.type === "ui") {
        if(actionRedM.hiddenUi != undefined || actionRedM.hiddenUi != null){
            document.getElementById('hud').style.display = 'none';
        }
        if (actionRedM.status == true & actionRedM.hiddenUi == false) {
            document.getElementById('hud').style.display = 'block';
            infinityCoreController.hudCoreRefreshing(actionRedM);
        }
    }else if(actionRedM.type === "SendNotification"){
        SendNotification(actionRedM)
    }else if(actionRedM.type === "actions_ui"){
        if (actionRedM.type == "actions_ui" && actionRedM.status) {
            document.getElementById("actions_ui").style.display = "block";
        }else{
            document.getElementById("actions_ui").style.display = "none";
        }
    }
})
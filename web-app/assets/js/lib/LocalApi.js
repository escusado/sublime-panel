//NativeApi is set from objective c
// Obj C   -> JS
// method: -> method_

Class('LocalApi').includes(CustomEventSupport)({
    prototype : {
        sendCommand : function sendCommand(command){
            var commandToSend = JSON.stringify(command);
            // console.log('sendCommand', commandToSend);
            NativeApi.sendCommand_(commandToSend);
        },

        dispatchCommand : function dispatchCommand(commandString){
            var command = JSON.parse(commandString);
            console.log('dispatchCommand: ', command);

            this.dispatch(command.name, {data: command.data});
        },

        showModal : function showModal(windowName){
            // console.log('showModal: ', windowName);
            NativeApi.showModal_(windowName);
        },

        closeModal : function closeModal(){
            // console.log('closeModal');
            NativeApi.closeModal();
        }
    }
});
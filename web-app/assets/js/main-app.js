LocalApi = new LocalApi();

$(document).ready(function(){
    LocalApi.bind('readSettingsFile:result', function(data){
        console.log('->', data);
    });
    LocalApi.desktopApiExec('readSettingsFile:', 'settings.json');
});
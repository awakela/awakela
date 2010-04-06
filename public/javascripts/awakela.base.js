function getClientTimeZoneOffset() {
	var rightNow = new Date();
	var t1 = new Date(rightNow.getFullYear(), rightNow.getMonth(), rightNow.getDate(), 0, 0, 0, 0);  // use current date, so that we could consider DST together
	var t2 = new Date(t1.toGMTString().substring(0, t1.toGMTString().lastIndexOf(" ")-1));
	return (t1 - t2) / (1000 * 60 * 60);
}

function convertTimeZone(timeZoneOffset) {
	var hours = parseInt(timeZoneOffset);
   	timeZoneOffset -= parseInt(timeZoneOffset);
	timeZoneOffset *= 60;
	var mins = parseInt(timeZoneOffset);
   	timeZoneOffset -= parseInt(timeZoneOffset);
	timeZoneOffset *= 60;
	var secs = parseInt(timeZoneOffset);
	var display_hours = hours;
	// handle GMT case (00:00)
	if (hours == 0) {
		display_hours = "00";
	} else if (hours > 0) {
		// add a plus sign and perhaps an extra 0
		display_hours = (hours < 10) ? "+0"+hours : "+"+hours;
	} else {
		// add an extra 0 if needed 
		display_hours = (hours > -10) ? "-0"+Math.abs(hours) : hours;
	}
	
	mins = (mins < 10) ? "0"+mins : mins;
	return display_hours+":"+mins;
}
function getClientTimeZone(){
	return convertTimeZone(getClientTimeZoneOffset());
}
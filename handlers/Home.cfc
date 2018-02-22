component{
	property name="mailgun" inject="mailgun";
	function index( event, rc, prc ){
		writedump(mailgun.getstats())
		abort;
	}
}

use Switch;
use strict;
use warnings;
use Selenium::Remote::Driver;

print "Choose one of the options:- \n 1)Search for a Google query \n 2) Login into facebook\n";
my $option = <>;                                                                                #Get the choice

#switch($option){
	#case 1 {
		if( $option == 1 ){
			
		print "Enter the query which you want to search in Google:- ";
		my $query = <>;                                                                         #Get the query

		print "You are searching for $query.....Working...";

		my $driver = Selenium::Remote::Driver->new;

		$driver->get("http://www.google.com");                                                  #Our target URL stands here

		my $title = $driver->get_title();
		print "$title\n";

		my $inputElement = $driver->find_element("q", "name");                                  #Now finding the different elements in the given webpage

		$inputElement->send_keys($query);                                                       #Send the keywords

		$inputElement->submit();

		$driver->set_implicit_wait_timeout(10000);

		my $num = 7;                                                                            #This is just the normal logic to give the time
		while($num--){
    		sleep(1);
		}

		#$driver->find_element("/html/head/title[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), $query)]");

		#$title = $driver->get_title();                                                         #This will fetch the title from browser
		#print "$title\n";

		$driver->quit();

	}else{
	#case 2 {
		print "Enter the facebook Login ID:- ";
		my $login = <>;
		print "Enter the facebook password:- ";
		my $pass = <>;

		my $driver = Selenium::Remote::Driver->new;

		$driver->get("http://www.facebook.com");

		my $title = $driver->get_title();
		print "$title\n";

		my $inputElement1 = $driver->find_element("email", "name");
		my $inputElement2 = $driver->find_element("pass", "name");
		my $inputElement3 = $driver->find_element("u_0_l", "id");

		$inputElement1->send_keys($login);
		$inputElement2->send_keys($pass);

		$driver->set_implicit_wait_timeout(10000);

		#xpath for login button-> /html/body/div/div[1]/div/div/div/div/div[2]/form/table/tbody/tr[2]/td[3]/label/input

		$inputElement3->submit();

		my $num = 7;
		while($num--){
    		sleep(1);
		}

		#$driver->find_element("/html/head/title[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), $query)]");

		#$title = $driver->get_title();
		#print "$title\n";

		$driver->quit();

	}
	



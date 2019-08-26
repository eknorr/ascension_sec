<!-- wp-config.php -->

<?php 
	error_reporting(0);
	@ini_set(('display_errors'), 0);
?>

<!-- 
	$table_prefix = 'wp_'; 						//changes the mysql prefixes?
	define('WP_DEBUG', false);					//disables the debugging display
    define('WP_DEBUG_DISPLAY', false);  		//disables the debugging display only on front end 
	define('DISALLOW_FILE_EDIT', true);			//disables plugin and theme editing
	define('FTP_SSL', true);                    //enforce the use of FTPs
	define('FS_METHOD', 'ssh2');				//enforce the use of STFPs
-->

<?php
function remove_all_login_errors( $error ) {
    return "Follow the white rabit";
}
add_filter( 'login_errors', 'remove_all_login_errors');
?>

-- in login  php
for login messages its 209 to set a blue message


<!--						
												//different security keys 

define('AUTH_KEY',         'b_/z#ig0jXum,D{*S<q<_br{|{cafcf9]JsNG(beu;0>&1!>wlcME|!:fY;Hb6.%');
define('SECURE_AUTH_KEY',  '0o*zR/_ubToVaxm|o7QZu+uqzv;w@He/wG4gh;vsl7{tfo59mWi2A0^RSWp+uBJ)');
define('LOGGED_IN_KEY',    'MlzMokdr7|oLXhf{p<#ASB{6EgqqK|[Le0lenuL]MZMt]F<ZBdWNGN9jlaU9[SgM');
define('NONCE_KEY',        '4o|SduUl<Ot:Q#yNt}M6V.jH>i=+z,Z?,=|+E(@2|u-x?a<+,%b,v,;}n:;40q3b');
define('AUTH_SALT',        'T/hChI|oY3$Np-H0-kp;o?&KpiO0Dcd|,Z@/pR!Fd&;H-:>rKGnh^>S4`C?3Nr|+');
define('SECURE_AUTH_SALT', 'sWwK2Ywl[@A=}3U-X%|`+}3j+nE/qTbj^N|bu*}6Mu8-#j`f|7Q5WDvC_4N Magq');
define('LOGGED_IN_SALT',   'i)w?0^2};/(uVC?n}60zpr[1}m>Z!/.|7C +^gl!,qp;@QB}z]i9{VF8/PR_M!.h');
define('NONCE_SALT',       '[;N8c|+vxKFga+c.rWa6y k.md`nU^|+h@+J{7>S--*0|]<+dzBzG2UM|O{<JffV');

define('AUTH_KEY',         'm!JRrEM1P-jKW;5_;L<V`/s:{J(k69Ao=Q>1G%|:giB_;||kPQ+rZvkp*FyBah(B');
define('SECURE_AUTH_KEY',  'i=8^sT]w4dtQR+-|o6pwd+X ydd%HMvvoW3:A$v+skXwy +/#A#X:E1C*5g!_:`&');
define('LOGGED_IN_KEY',    'mp0~|fNGs#o%D;^)5)}6Y,xxgKOuQLvDwvZ{p{_?8Tk0a{D>V JW9xC+;2.O={-a');
define('NONCE_KEY',        '1GCxY2/p4fjG?IgRK}Y+fSB>))).6:_rbp@g/}7s,LbObJ-=gZ%H6/6l`bOTej#W');
define('AUTH_SALT',        '$One/fB6i:=8N^!R#0+-H_;BqT>pwL$IwCh|?XmFBT6E&YpyXz|^{gcF0Qs|SQ1;');
define('SECURE_AUTH_SALT', '9UFQra{:[~-kJ|Y!^vu2{EY;g%Z#+DDOHVR40|LP3%]&.|5=|Ckp{-&Xw;+DZIz`');
define('LOGGED_IN_SALT',   'F$D5`%DpHFq`5H;R_6<}Bp{O3p6e+qM6X1Pp|1U)dCF<2xJvl,IO,V?^.Ybeyb#g');
define('NONCE_SALT',       'E~peZf_9a$#pr8C6ax]NvJ{qbG*$)0fTM:jhsXX=n9GZZ5sd Sd~tUXT+&~!g{+y');

define('AUTH_KEY',         'Q8,UtuSBaNa[V[--8)tN!5ex&siE~F.d|Dpz8J1B7:d :Q=j|8_!a~+o,.I ?@*~');
define('SECURE_AUTH_KEY',  '4dmvK}JZ%d(E]*+[qjx1^wu=~&:(+.7zO0&<{)&pXPy=^+$PYH:^d/XWed-me/Ur');
define('LOGGED_IN_KEY',    '2hR2/,wu*qY{^ZmhgBe|w?sI>3#fh|,N0+]>>tmb@};$dS/w[+@h-MT[H0C+6YYM');
define('NONCE_KEY',        'r)0i2fEub&5os@nHo>J-16Rs+Q;c|zFr%&:Wd+ssdY]@Rbe,n!MN.+naMVN0Pr(;');
define('AUTH_SALT',        'YD0m,,B9BUpa#EH*o|=qTrhy3WE`-G|cuJ1-M(_6dqRkR}9EF*iBf41]d~N0kw:<');
define('SECURE_AUTH_SALT', 'V3(+dy|dR~zV)t*GPt.lFa}7q-|tS+uWd[#Dm(:q+Bn2:n?>9;Bs)R~cZf-K|i(P');
define('LOGGED_IN_SALT',   '1pFJ<(MjbiLZ+pcFa&z=+xZ`yA l_%%mqC,::%hmS1`gH?)]C3^NB#H=kcy--Z3^');
define('NONCE_SALT',       '$.]T=_~<@0Y9|!6&3%OATQ1>ftuX`6((!6`GZ-GG#-@8uCQv!P|`fY:A~X-%krQM');	
-->
/*
    Very Simple Toon Shadre for RenderMan REYES
    toon05 made by Hirofumi Inomata, (C) 1998-1999
    MIT License ( https://opensource.org/licenses/mit-license.php )
 */

surface
toon05 (
	color iv_border = 0.1;
	color iv_shadow = 0.2;
	color iv_color = 0.5;
	color iv_bright = 1.0;
	float iv_range_shadow = 0.7;
	float iv_range_bright = 0.9;
	float iv_range_border = 0.2;
	float iv_transparency = 1;
	string texturename = "";
) {
	point Nf;
	color Ct;
	color CC;
	point Dir;
	float Len;
	float Lcos;
	float Dcos;
	point NN;
	point LL1;
	point LL2;
	float II;


	illuminance (P, N, 3.1412 ) {

		if (texturename != "")
			Ct = color texture (texturename);
		else Ct = 1;

		NN = normalize( N );

		LL1 = - normalize( L - P );

		LL2 = (2.0 * (LL1 . NN)) * NN - LL1;

		LL2 = normalize( LL2 );


		Dir = normalize( E - P );

/*		Dir = - normalize( I );	*/

		Dcos = Dir . LL2;

		Lcos = Dir . NN;

/*		II = sqrt( I . I ); */ II = 1.0;

		if ( (Dcos > iv_range_shadow) ) {
			Ci = Cl;
			Oi = 0.0;
		} else 
		if ( (Dcos < - iv_range_bright) ) {
			if ((Cl . Cl) > 0.1) {
				Ci = Cl;
				Oi = 1.0;
			} else {
				Ci = 0.0;
				Oi = 0.0;
			}
		} else {

			if ((Cl . Cl) > 0.1) {
				Ci = 0.0;
				Oi = 0.0;
			} else {
				Ci = 0.0;
				Oi = 0.0;
			}
		}
	}
}


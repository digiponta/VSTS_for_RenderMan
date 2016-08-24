/*
    Very Simple Toon Shadre for RenderMan REYES
    toon06 made by Hirofumi Inomata, (C) 1998-1999
    MIT License ( https://opensource.org/licenses/mit-license.php )
 */

surface
toon06 (
	color iv_border = 0.1;
	color iv_shadow = 0.2;
	color iv_bright = 1.0;
	float iv_range_shadow = 0.7;
	float iv_range_bright = 0.9;
	float iv_range_border = 0.2;
	float iv_transparency = 1;
	float iv_bump_scale = 0.2;
	float iv_eye_ds = 0.5;
	float iv_eye_dt = 0.5;
	string texture_face = "";
	string texture_eye = "";
	string bump_name = "";
) {
	point Nf;
	color Ct;
	color Ceye;
	color Cb;
	color Ce;
	float sp;
	float po;
	color CC;
	point Dir;
	float Len;
	float Lcos;
	float Dcos;
	point NN;
	point LL1;
	point LL2;
	float II;
	color iv_color;
	point oft;
	float ds;
	float dt;
	point Ishad;
	vector Nshad;
	vector Nd;
	point Pshad;

	Ci = 0;
	iv_color = Cs;

	illuminance (P, N, 3.1412 ) {

		NN = normalize( N );

		if (bump_name != "") {
		
			Nd = N - Ng;
			Nshad = vtransform( "shader", N );
			Pshad = transform( "shader", P );
			Cb = color texture ( bump_name, s, 1-t,"filter", "gaussian", "width", 
				0.25 );
			oft = normalize(Nshad) * (( comp(Cb, 0) - 0.5) * 2.0 )* iv_bump_scale;
/*
			Pshad += oft;
			P = transform( "shader", "current", Pshad );
			N = calculatenormal( P ) + Nd;
			NN = normalize( N );
*/
/*
			Cb = color texture ( bump_name, s, 1-t,"filter", "gaussian", "width", 0.25 );
			oft = NN * (( comp(Cb, 0) - 0.5) * 2.0 )* iv_bump_scale;
*/
			sp = comp( Cb, 1 );
			dt = (I . dPdu ) * length( oft ) / (I . NN);
			ds = (I . dPdv ) * length( oft ) / (I . NN);
/*			
			Cb = color texture ( bump_name, (s - ds), 1- (t - dt),"filter", 
			    "gaussian", "width", 0.25 );
*/
			po = comp( Cb, 2 );
		} else {
			Cb = 0.0;
			sp =1.0;
			po =0.0;
			oft = 0;
			ds = 0;
			dt = 0;
		}

		if (texture_face != "") {
			Ct = color texture (texture_face, s, 1-t,"filter", "gaussian","width", 0.25 );
		} else {
			Ct = 1;
		}
	
		if (texture_eye != "") {
			Ceye = color texture (texture_eye, (
				s + 0.1*(iv_eye_ds - 0.5)), 
				1- (t + 0.1*(iv_eye_dt - 0.5)),
				"filter", "gaussian","width", 0.25 );
		} else {
			Ceye = 1;
		}

		{	LL1 = - normalize( L );

			LL2 = (2.0 * (LL1 . NN)) * NN - LL1;

			LL2 = normalize( LL2 );

			Dir = - normalize( I );

			Dcos = Dir . LL2;

			Lcos = Dir . NN;

			II = 1.0; 
			/*	II = sqrt( I . I );	*/

			if ( (Dcos > iv_range_shadow) ) {
			/*	Ci += (iv_shadow * Ct) * II + po;	*/
				Ci += ((1.0 - sp)* (iv_shadow * Ct) +(po + iv_shadow * Ceye ) * sp) * Cl * iv_bright;
				Oi = 1.0;
			} else 
			if ( (Dcos < - iv_range_bright) ) {
				Ci += ((1.0 - sp)* (iv_color * Ct) +( po + iv_color * Ceye) * sp) * Cl * iv_bright;
				Oi = 1.0;
			} else {

				Ci += (1.0 - sp)*(iv_color * Ct) * Cl + ((po + iv_color * Ceye) * sp);
				Oi = 1.0;
			}

			if ( (Lcos > - iv_range_border) && (Lcos < iv_range_border) ) {
				Ci = iv_border;
			} else {
			}
		}
	}
}


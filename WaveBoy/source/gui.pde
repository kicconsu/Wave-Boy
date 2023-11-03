/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void bsim_click(GImageButton source, GEvent event) { //_CODE_:imgButton1:562624:
  bombo.trigger();

  getSurface().setVisible(false);
  Modos.setVisible(true);
  Modos.loop();
} //_CODE_:imgButton1:562624:

public void bplay_click(GImageButton source, GEvent event) { //_CODE_:imgButton2:869295:
  bombo.trigger();
  getSurface().setVisible(false);

  UserGUI.loop();
  UserGUI.setVisible(true);
} //_CODE_:imgButton2:869295:

public void ayuda_click1(GImageButton source, GEvent event) { //_CODE_:ayuda:414475:
  bombo.trigger();
  getSurface().setVisible(false);
  Ayuda.loop();
  Ayuda.setVisible(true);
} //_CODE_:ayuda:414475:

synchronized public void simu_draw(PApplet appc, GWinData data) { //_CODE_:Simu:296752:

  if (Simu.isVisible()) {
    //fondo
    Simu.image(fondo, 0, 0);
    //Subrutina para visualizar puntos e imagenes
    drawSim(Simu);
  }
} //_CODE_:Simu:296752:

public void frecuencia_sl(GCustomSlider source, GEvent event) { //_CODE_:frec_sl:827075:
  frec=frec_sl.getValueF();
} //_CODE_:frec_sl:827075:

public void longitud_sl(GCustomSlider source, GEvent event) { //_CODE_:lon_sl:943122:
  lon=lon_sl.getValueI();
} //_CODE_:lon_sl:943122:

public void amplitud_sl(GCustomSlider source, GEvent event) { //_CODE_:amp_sl:324721:
  amp=amp_sl.getValueF();
} //_CODE_:amp_sl:324721:

public void mostInc(GImageToggleButton source, GEvent event) { //_CODE_:mostIncid:447650:
  btn2.trigger();
  if (mostInci==1) {
    mostInci=0;
  } else {
    mostInci=1;
  }
} //_CODE_:mostIncid:447650:

public void mostRefe(GImageToggleButton source, GEvent event) { //_CODE_:mostRefle:899898:
  btn2.trigger();
  if (mostRefl==1) {
    mostRefl=0;
  } else {
    mostRefl=1;
  }
} //_CODE_:mostRefle:899898:

public void simu_to_menu(GImageButton source, GEvent event) { //_CODE_:menuuu:849836:
  bombo.trigger();
  frameRate(60);
  getSurface().setVisible(true);
  Simu.setVisible(false);
  Simu.noLoop();
} //_CODE_:menuuu:849836:

public void pausa_simu(GImageButton source, GEvent event) { //_CODE_:pau:223520:
  btn2.trigger();
  Simu.noLoop();
  despau.setVisible(true);
  pau.setVisible(false);
} //_CODE_:pau:223520:

public void b_reset_sim(GImageButton source, GEvent event) { //_CODE_:reset:808422:
  btn2.trigger();
  theta = 0;
  setupSimWave();
} //_CODE_:reset:808422:

public void despau_simu(GImageButton source, GEvent event) { //_CODE_:despau:986299:
  btn2.trigger();
  Simu.loop();
  despau.setVisible(false);
  pau.setVisible(true);
} //_CODE_:despau:986299:

synchronized public void Instru_draw(PApplet appc, GWinData data) { //_CODE_:Instru:566139:
  try{
  Instru.image(CSJ1, 0, 0);
  b_jugar.setVisible(true);
  if (r==0) {
    izq.setVisible(false);
  }
  if (vv==1) {//Mostrar instrucciones 2
    Instru.image(CSJ2, 0, 0);
    der.setVisible(true);
    if (r==1||r==2) {
      izq.setVisible(true);
    }
  }
  if (vv==2) { //Mostrar instrucciones 3
    Instru.image(CSJ3, 0, 0);
    if (r==1||r==2) {
      izq.setVisible(true);
    }
    if (r==2) {
      der.setVisible(false);
    }
  }
  if (vv==0) { //Mostrar instrucciones 1
    Instru.image(CSJ1, 0, 0);
    izq.setVisible(false);
    der.setVisible(true);
  }
  }catch(NullPointerException e){
    
  }
} //_CODE_:Instru:566139:

public void derecha(GImageButton source, GEvent event) { //_CODE_:der:361666:
  bombo.trigger();
  vv=vv+1;
  r=r+1;
} //_CODE_:der:361666:

public void izquierda(GImageButton source, GEvent event) { //_CODE_:izq:429881:
  bombo.trigger();
  vv=vv-1;
  r=r-1;
} //_CODE_:izq:429881:

public void gameplay_click1(GImageButton source, GEvent event) { //_CODE_:b_jugar:230791:
  bombo.trigger();
  Instru.setVisible(false);
  Instru.noLoop();
  jugar();
} //_CODE_:b_jugar:230791:

synchronized public void Juego_draw(PApplet appc, GWinData data) { //_CODE_:Juego:809167:
  Juego.background(230);
  //Subrutina para la interfaz del juego...
  gameDrawGUI();
  //Subrutina para el dibujo de las ondas
  gameWavesDraw();
} //_CODE_:Juego:809167:

public void DTension(GButton source, GEvent event) { //_CODE_:DecTension:400419:
  btn.trigger();
  if (tens>1) {
    tens--;
  }
  t_tens.setText(""+tens);
} //_CODE_:DecTension:400419:

public void textarea1_change1(GTextArea source, GEvent event) { //_CODE_:t_tens:712598:
} //_CODE_:t_tens:712598:

public void btens(GButton source, GEvent event) { //_CODE_:b_tens:291673:
  int val;
  val=Integer.valueOf(t_tens.getText());
  if (val>35||val<1) {
    t_tens.setText("Error");
  } else {
    tens=val;
    t_tens.setText(""+tens);
  }
} //_CODE_:b_tens:291673:

public void ITension(GButton source, GEvent event) { //_CODE_:IncTension:402883:
  btn.trigger();
  if (tens<35) {
    tens++;
  }
  t_tens.setText(""+tens);
} //_CODE_:IncTension:402883:

public void DNiu(GButton source, GEvent event) { //_CODE_:DecNiu:600833:
  btn.trigger();

  niu=(int)(niu*100);
  if (niu>1) {
    niu=(int)(niu-2);
  }
  niu/=100;

  t_niu.setText(""+niu);

  pointRadius = calcRadius(niu);
} //_CODE_:DecNiu:600833:

public void textarea1_change2(GTextArea source, GEvent event) { //_CODE_:t_niu:551398:
} //_CODE_:t_niu:551398:

public void bniu(GButton source, GEvent event) { //_CODE_:b_niu:335749:
  try {

    float val;
    val=Float.valueOf(t_niu.getText());
    if (val<0.00||val>0.71) {
      t_niu.setText("Error");
    } else {
      niu=val;
      t_niu.setText(""+niu);
    }
  }
  catch(Exception e) {
    t_niu.setText("Error");
  }
} //_CODE_:b_niu:335749:

public void INiu(GButton source, GEvent event) { //_CODE_:IncNiu:607898:
  btn.trigger();

  niu=(int)(niu*100);
  if (niu<71) {
    niu=(niu+5);
  }
  niu= niu/100;
  t_niu.setText(""+niu);

  pointRadius = calcRadius(niu);
} //_CODE_:IncNiu:607898:

public void DAmpl(GButton source, GEvent event) { //_CODE_:DecAmpl:704694:
  btn.trigger();
  if (amp>1) {
    amp-=1;
  }
  t_amp.setText(""+amp);
} //_CODE_:DecAmpl:704694:

public void textarea1_change3(GTextArea source, GEvent event) { //_CODE_:t_amp:868004:
} //_CODE_:t_amp:868004:

public void bamp(GButton source, GEvent event) { //_CODE_:b_amp:596782:
  try {
    int val;
    val=Integer.valueOf(t_amp.getText());

    if (val>100||val<1) {
      t_amp.setText("Error");
    } else {
      amp=val;
      t_amp.setText(""+amp);
    }
  }
  catch(Exception e) {
    t_niu.setText("Error");
  }
} //_CODE_:b_amp:596782:

public void IAmp(GButton source, GEvent event) { //_CODE_:IncAmpl:492180:
  btn.trigger();
  if (amp<100) {
    amp+=5;
  }
  t_amp.setText(""+amp);
} //_CODE_:IncAmpl:492180:

public void jugar_to_menu(GImageButton source, GEvent event) { //_CODE_:menuu:797945:
  bombo.trigger();
  limpiar();
  getSurface().setVisible(true);
  Juego.setVisible(false);
  Juego.noLoop();
} //_CODE_:menuu:797945:

public void verii(GImageButton source, GEvent event) { //_CODE_:verify:269262:

  // Se vienen cositas

  startTimerPuntaje = new TimerPuntaje(3);

  verifi.trigger();

  b=1;

  int I_vel, I_lamb, I_amp;

  I_vel = (int)(velS*100-vel*100);

  I_lamb = (int)(lamS*100-lamb*100);

  I_amp = (int)(ampS-amp);

  // Vel
  aux=calcpunt(Math.abs(I_vel), false)+calcpunt(Math.abs(I_lamb), false)+calcpunt(Math.abs(I_amp), true);

  puntaje+=aux;

  //
} //_CODE_:verify:269262:

synchronized public void Puntaje_draw(PApplet appc, GWinData data) { //_CODE_:Puntaje:227115:
  appc.background(230);
  Puntaje.image(pun, 0, 0);

  PFont f = createFont("Calibri Bold", 16);
  Puntaje.textFont(f);
  Puntaje.textSize(64);

  if (cpfinal<puntaje) {
    cpfinal+=1;
    player.play();
  } else if (cpfinal==puntaje) {
    player.pause();
  }


  String puntAlcanzado = ""+dfP.format(cpfinal);
  Puntaje.text(puntAlcanzado, 600, 420);
} //_CODE_:Puntaje:227115:

public void punt_to_menu(GImageButton source, GEvent event) { //_CODE_:b_menuPuntaje:480354:
  pI++;
  player.pause();
  bombo.trigger();
  limpiar();
  Puntaje.setVisible(false);
  Puntaje.noLoop();
  getSurface().setVisible(true);
} //_CODE_:b_menuPuntaje:480354:

public void jugarPuntaje(GImageButton source, GEvent event) { //_CODE_:b_jugarPuntaje:835823:
  bombo.trigger();
  player.pause();
  limpiar();
  Puntaje.setVisible(false);
  Puntaje.noLoop();
  jugar();
} //_CODE_:b_jugarPuntaje:835823:

public void pun_to_ldb(GImageButton source, GEvent event) { //_CODE_:b_ldb:349860:
  player.pause();
  bombo.trigger();
  limpiar();

  // ordenamiento todo joperico xddddddd

  int a1, a2, a3, t=0, tt = 1;
  String b1, b2, b3;
  
  for (int i = 0; i<499; i++) {
    for(int j = 1; j<499-i; j++){
      
      a1 = Integer.valueOf(UserNScore[1][j]);
      a2 = Integer.valueOf(UserNScore[1][j+1]);
      
      b1 = UserNScore[0][j];
      b2 = UserNScore[0][j+1];
      
      if(a1<a2){
        
        a3=a1;        
        UserNScore[1][j]=String.valueOf(a2);
        UserNScore[1][j+1]=String.valueOf(a3);
        
        b3=b1;
        UserNScore[0][j]=b2;
        UserNScore[0][j+1]=b3;
      }
    }
  }
  
  while(t<499 && tt == 1){
   
    if(Integer.valueOf(UserNScore[1][t]) == Integer.valueOf(auxPuntaje)){
      pos = t;
      tt = 2;
      
    }
    
    t++;
  }
  
  



  Puntaje.setVisible(false);
  Puntaje.noLoop();

  Leaderboard.setVisible(true);
  Leaderboard.loop();
} //_CODE_:b_ldb:349860:

synchronized public void help_draw1(PApplet appc, GWinData data) { //_CODE_:Ayuda:467491:

  Ayuda.background(230);
  if (c==0) {

    izqui.setVisible(false);
  }
  switch(rr) {
  case 0:
    // Mostrar ayuda Slide 1
    indice();
    Ayuda.image(gif_frec_1[pumindex], 0, 0);
    izqui.setVisible(false);
    dere.setVisible(true);
    break;
  case 1:
    // Mostrar ayuda Slide 2
    dere.setVisible(true);
    if (c==1||c==2) {
      izqui.setVisible(true);
    }
    //GIF
    indice();
    Ayuda.image(gif_frec_2[pumindex], 0, 0);
    Ayuda.image(rod, 750, 20);
    break;
  case 2:
    // Mostrar ayuda Slide 3
    indice();
    Ayuda.image(gif_amp[ampindex], 0, 0);
    if (c==1||c==2) {
      izqui.setVisible(true);
      dere.setVisible(true);
    }
    break;
  case 3:
    // Mostrar ayuda Slide 4
    indice();
    Ayuda.image(gif_tens[tensindex], 0, 0);
    if (c==1||c==2||c==3) {
      izqui.setVisible(true);
      dere.setVisible(true);
    }
    break;
  case 4:
    // Mostrar ayuda Slide 5
    indice();
    Ayuda.image(gif_niu[pumindex], 0, 0);
    if (c==4) {
      izqui.setVisible(true);
      dere.setVisible(false);
    }
    break;
  }
} //_CODE_:Ayuda:467491:

public void derecha_click1(GImageButton source, GEvent event) { //_CODE_:dere:931589:
  bombo.trigger();
  rr=rr+1;
  c=c+1;
} //_CODE_:dere:931589:

public void izquierda_click1(GImageButton source, GEvent event) { //_CODE_:izqui:913286:
  bombo.trigger();
  rr=rr-1;
  c=c-1;
} //_CODE_:izqui:913286:

public void ayud_to_menu(GImageButton source, GEvent event) { //_CODE_:menub:418414:
  bombo.trigger();
  Ayuda.setVisible(false);
  Ayuda.noLoop();
  getSurface().setVisible(true);
} //_CODE_:menub:418414:

synchronized public void Modos_draw(PApplet appc, GWinData data) { //_CODE_:Modos:859405:
  Modos.image(mod, 0, 0);
} //_CODE_:Modos:859405:

public void mod_normal(GImageButton source, GEvent event) { //_CODE_:norma:851502:
  bombo.trigger();

  setupSimWave();
  setupNormalesVariables();

  Modos.setVisible(false);
  Modos.noLoop();

  Normales.setVisible(true);
  Normales.loop();
} //_CODE_:norma:851502:

public void frec_libre(GImageButton source, GEvent event) { //_CODE_:simu:673019:
  bombo.trigger();

  setupSimWave();
  setupSimVariables();

  Modos.setVisible(false);
  Modos.noLoop();

  Simu.loop();
  Simu.setVisible(true);
} //_CODE_:simu:673019:

synchronized public void Normales_draw(PApplet appc, GWinData data) { //_CODE_:Normales:690521:

  // GUI

  Normales.image(fondo_armo, 0, 0);
  Normales.image(pantalla, 1050, 245);

  NormalWaveRefresh(); // Calculo de la armonica

  drawSim(Normales); // Dibujo de la onda

  //Subrutina para la pantalla de datos
  dataScreen(Normales);
} //_CODE_:Normales:690521:

public void normal_to_menu(GImageButton source, GEvent event) { //_CODE_:normal2menu:814459:
  bombo.trigger();
  Normales.setVisible(false);
  Normales.noLoop();
  getSurface().setVisible(true);
} //_CODE_:normal2menu:814459:

public void armo_slider(GCustomSlider source, GEvent event) { //_CODE_:armo_sl:808710:
  armo=armo_sl.getValueI();
} //_CODE_:armo_sl:808710:

public void tens_slider_2(GCustomSlider source, GEvent event) { //_CODE_:tens_sl_2:433728:
  tens=tens_sl_2.getValueF();
} //_CODE_:tens_sl_2:433728:

public void despausa_normales(GImageButton source, GEvent event) { //_CODE_:despau_norm:762359:
  btn2.trigger();
  Normales.loop();

  pau_norm.setVisible(true);
  despau_norm.setVisible(false);
} //_CODE_:despau_norm:762359:

public void pausa_normales(GImageButton source, GEvent event) { //_CODE_:pau_norm:824120:
  btn2.trigger();
  Normales.noLoop();
  pau_norm.setVisible(false);
  despau_norm.setVisible(true);
} //_CODE_:pau_norm:824120:

public void niu_slider_2(GCustomSlider source, GEvent event) { //_CODE_:dens_sl_2:428542:
  niu=dens_sl_2.getValueF();
} //_CODE_:dens_sl_2:428542:

public void amp_slider_2(GCustomSlider source, GEvent event) { //_CODE_:amp_sl_2:629305:
  amp=amp_sl_2.getValueF();
} //_CODE_:amp_sl_2:629305:

synchronized public void user_draw(PApplet appc, GWinData data) { //_CODE_:UserGUI:871305:
  UserGUI.image(userGUI, 0, 0);

  username.setFont(new Font("Calibri Bold", Font.PLAIN, 65));
  username.setTextBold();
} //_CODE_:UserGUI:871305:

public void adduser(GTextField source, GEvent event) { //_CODE_:username:362377:
} //_CODE_:username:362377:

public void Agregar_y_Jugar(GImageButton source, GEvent event) { //_CODE_:agUser:927073:
  bombo.trigger();
  if(username.getText().isBlank()){
      UserNScore[0][pI]="Jugador No. "+(pI+1);
  }else{
      UserNScore[0][pI]=username.getText();
  }
  username.setText("");


  UserGUI.setVisible(false);
  UserGUI.noLoop();

  Instru.setVisible(true);
  Instru.loop();
} //_CODE_:agUser:927073:

synchronized public void leaderboard_draw(PApplet appc, GWinData data) { //_CODE_:Leaderboard:244264:
  Leaderboard.image(ldb, 0, 0);
  
  leaderboard();
  
} //_CODE_:Leaderboard:244264:

public void ldb_to_menu(GImageButton source, GEvent event) { //_CODE_:b_menu:614315:
  pI++;

  bombo.trigger();
  Leaderboard.setVisible(false);
  Leaderboard.noLoop();

  getSurface().setVisible(true);
} //_CODE_:b_menu:614315:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  imgButton1 = new GImageButton(this, 400, 307, 490, 78, new String[] { "simfondo.png", "simclicked.png", "sim.png" } );
  imgButton1.addEventHandler(this, "bsim_click");
  imgButton2 = new GImageButton(this, 400, 426, 490, 78, new String[] { "jugfondo.png", "jugclicked.png", "jugclicked.png" } );
  imgButton2.addEventHandler(this, "bplay_click");
  ayuda = new GImageButton(this, 400, 546, 490, 78, new String[] { "ayudoff.png", "ayudclicked.png", "ayudoff.png" } );
  ayuda.addEventHandler(this, "ayuda_click1");
  Simu = GWindow.getWindow(this, "simulacion", 0, 0, 1280, 720, JAVA2D);
  Simu.noLoop();
  Simu.setActionOnClose(G4P.EXIT_APP);
  Simu.addDrawHandler(this, "simu_draw");
  frec_sl = new GCustomSlider(Simu, 220, 580, 150, 60, "red_yellow18px");
  frec_sl.setShowValue(true);
  frec_sl.setShowLimits(true);
  frec_sl.setLimits(0.0, 0.0, 4.0);
  frec_sl.setShowTicks(true);
  frec_sl.setEasing(4.0);
  frec_sl.setNumberFormat(G4P.DECIMAL, 2);
  frec_sl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  frec_sl.setOpaque(true);
  frec_sl.addEventHandler(this, "frecuencia_sl");
  lon_sl = new GCustomSlider(Simu, 580, 580, 150, 60, "red_yellow18px");
  lon_sl.setShowValue(true);
  lon_sl.setShowLimits(true);
  lon_sl.setLimits(3, 3, 40);
  lon_sl.setShowTicks(true);
  lon_sl.setEasing(4.0);
  lon_sl.setNumberFormat(G4P.INTEGER, 0);
  lon_sl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  lon_sl.setOpaque(true);
  lon_sl.addEventHandler(this, "longitud_sl");
  amp_sl = new GCustomSlider(Simu, 910, 580, 150, 60, "red_yellow18px");
  amp_sl.setShowValue(true);
  amp_sl.setShowLimits(true);
  amp_sl.setLimits(0.0, 0.0, 100.0);
  amp_sl.setShowTicks(true);
  amp_sl.setEasing(4.0);
  amp_sl.setNumberFormat(G4P.DECIMAL, 2);
  amp_sl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  amp_sl.setOpaque(true);
  amp_sl.addEventHandler(this, "amplitud_sl");
  mostIncid = new GImageToggleButton(Simu, 1170, 50);
  mostIncid.addEventHandler(this, "mostInc");
  mostRefle = new GImageToggleButton(Simu, 1170, 120);
  mostRefle.addEventHandler(this, "mostRefe");
  menuuu = new GImageButton(Simu, 1132, 469, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  menuuu.addEventHandler(this, "simu_to_menu");
  pau = new GImageButton(Simu, 650, 50, 60, 60, new String[] { "pausa.png", "pausa.png", "pausa.png" } );
  pau.addEventHandler(this, "pausa_simu");
  reset = new GImageButton(Simu, 450, 50, 60, 60, new String[] { "reset.png", "reseton.png", "resetclicked.png" } );
  reset.addEventHandler(this, "b_reset_sim");
  despau = new GImageButton(Simu, 650, 50, 60, 60, new String[] { "despausa.png", "despausa.png", "despausa.png" } );
  despau.addEventHandler(this, "despau_simu");
  Instru = GWindow.getWindow(this, "Instrucciones", 0, 0, 1280, 720, JAVA2D);
  Instru.noLoop();
  Instru.setActionOnClose(G4P.EXIT_APP);
  Instru.addDrawHandler(this, "Instru_draw");
  der = new GImageButton(Instru, 1145, 640, 100, 60, new String[] { "csjd.png", "csj_ed.png", "csj_clickd.png" } );
  der.addEventHandler(this, "derecha");
  izq = new GImageButton(Instru, 24, 640, 100, 60, new String[] { "csjiz.png", "csj_eiz.png", "csj_clickiz.png" } );
  izq.addEventHandler(this, "izquierda");
  b_jugar = new GImageButton(Instru, 575, 587, 115, 105, new String[] { "Jugar1.png", "jugar2.png", "jugar3.png" } );
  b_jugar.addEventHandler(this, "gameplay_click1");
  Juego = GWindow.getWindow(this, "Juego", 0, 0, 1280, 720, JAVA2D);
  Juego.noLoop();
  Juego.setActionOnClose(G4P.EXIT_APP);
  Juego.addDrawHandler(this, "Juego_draw");
  DecTension = new GButton(Juego, 268, 623, 37, 40);
  DecTension.setIcon("flecha2.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  DecTension.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  DecTension.addEventHandler(this, "DTension");
  label1 = new GLabel(Juego, 272, 674, 32, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("-1");
  label1.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label1.setOpaque(true);
  t_tens = new GTextArea(Juego, 346, 623, 50, 40, G4P.SCROLLBARS_NONE);
  t_tens.setText("1.0");
  t_tens.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  t_tens.setOpaque(true);
  t_tens.addEventHandler(this, "textarea1_change1");
  b_tens = new GButton(Juego, 346, 673, 55, 20);
  b_tens.setText("Agregar");
  b_tens.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  b_tens.addEventHandler(this, "btens");
  IncTension = new GButton(Juego, 436, 622, 38, 40);
  IncTension.setIcon("flecha.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  IncTension.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  IncTension.addEventHandler(this, "ITension");
  label2 = new GLabel(Juego, 439, 673, 32, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("+1");
  label2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label2.setOpaque(true);
  DecNiu = new GButton(Juego, 552, 623, 38, 40);
  DecNiu.setIcon("flecha2.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  DecNiu.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  DecNiu.addEventHandler(this, "DNiu");
  label3 = new GLabel(Juego, 553, 673, 32, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("-0.02");
  label3.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label3.setOpaque(true);
  t_niu = new GTextArea(Juego, 608, 622, 50, 40, G4P.SCROLLBARS_NONE);
  t_niu.setText("0.3");
  t_niu.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  t_niu.setOpaque(true);
  t_niu.addEventHandler(this, "textarea1_change2");
  b_niu = new GButton(Juego, 605, 674, 55, 20);
  b_niu.setText("Agregar");
  b_niu.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  b_niu.addEventHandler(this, "bniu");
  IncNiu = new GButton(Juego, 676, 623, 38, 40);
  IncNiu.setIcon("flecha.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  IncNiu.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  IncNiu.addEventHandler(this, "INiu");
  label4 = new GLabel(Juego, 679, 673, 35, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("+0.05");
  label4.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label4.setOpaque(true);
  DecAmpl = new GButton(Juego, 790, 623, 38, 40);
  DecAmpl.setIcon("flecha2.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  DecAmpl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  DecAmpl.addEventHandler(this, "DAmpl");
  label5 = new GLabel(Juego, 792, 673, 31, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("-1");
  label5.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label5.setOpaque(true);
  t_amp = new GTextArea(Juego, 868, 623, 50, 40, G4P.SCROLLBARS_NONE);
  t_amp.setText("5.0");
  t_amp.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  t_amp.setOpaque(true);
  t_amp.addEventHandler(this, "textarea1_change3");
  b_amp = new GButton(Juego, 867, 673, 55, 20);
  b_amp.setText("Agregar");
  b_amp.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  b_amp.addEventHandler(this, "bamp");
  IncAmpl = new GButton(Juego, 957, 623, 38, 40);
  IncAmpl.setIcon("flecha.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  IncAmpl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  IncAmpl.addEventHandler(this, "IAmp");
  label6 = new GLabel(Juego, 960, 673, 32, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("+5");
  label6.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label6.setOpaque(true);
  menuu = new GImageButton(Juego, 1154, 394, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  menuu.addEventHandler(this, "jugar_to_menu");
  verify = new GImageButton(Juego, 1153, 213, 115, 105, new String[] { "v1.png", "v2.png", "v3.png" } );
  verify.addEventHandler(this, "verii");
  Puntaje = GWindow.getWindow(this, "Puntaje", 0, 0, 1280, 720, JAVA2D);
  Puntaje.noLoop();
  Puntaje.setActionOnClose(G4P.EXIT_APP);
  Puntaje.addDrawHandler(this, "Puntaje_draw");
  b_menuPuntaje = new GImageButton(Puntaje, 360, 510, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  b_menuPuntaje.addEventHandler(this, "punt_to_menu");
  b_jugarPuntaje = new GImageButton(Puntaje, 800, 510, 115, 105, new String[] { "Jugar1.png", "jugar2.png", "jugar3.png" } );
  b_jugarPuntaje.addEventHandler(this, "jugarPuntaje");
  b_ldb = new GImageButton(Puntaje, 580, 510, 115, 105, new String[] { "tboff.png", "tbon.png", "tbcl.png" } );
  b_ldb.addEventHandler(this, "pun_to_ldb");
  Ayuda = GWindow.getWindow(this, "Ayuda", 0, 0, 1280, 720, JAVA2D);
  Ayuda.noLoop();
  Ayuda.setActionOnClose(G4P.CLOSE_WINDOW);
  Ayuda.addDrawHandler(this, "help_draw1");
  dere = new GImageButton(Ayuda, 1169, 648, 100, 60, new String[] { "csjd.png", "csj_ed.png", "csj_clickd.png" } );
  dere.addEventHandler(this, "derecha_click1");
  izqui = new GImageButton(Ayuda, 18, 648, 100, 60, new String[] { "csjiz.png", "csj_eiz.png", "csj_clickiz.png" } );
  izqui.addEventHandler(this, "izquierda_click1");
  menub = new GImageButton(Ayuda, 600, 600, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  menub.addEventHandler(this, "ayud_to_menu");
  Modos = GWindow.getWindow(this, "Modos", 0, 0, 1280, 720, JAVA2D);
  Modos.noLoop();
  Modos.setActionOnClose(G4P.CLOSE_WINDOW);
  Modos.addDrawHandler(this, "Modos_draw");
  norma = new GImageButton(Modos, 343, 306, new String[] { "modnormaloff.png", "modnormalon.png", "modnormalon.png" } );
  norma.addEventHandler(this, "mod_normal");
  simu = new GImageButton(Modos, 343, 441, new String[] { "freclibreoff.png", "freclibreon.png", "freclibreon.png" } );
  simu.addEventHandler(this, "frec_libre");
  Normales = GWindow.getWindow(this, "Normales", 0, 0, 1280, 720, JAVA2D);
  Normales.noLoop();
  Normales.setActionOnClose(G4P.CLOSE_WINDOW);
  Normales.addDrawHandler(this, "Normales_draw");
  normal2menu = new GImageButton(Normales, 1132, 469, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  normal2menu.addEventHandler(this, "normal_to_menu");
  armo_sl = new GCustomSlider(Normales, 230, 580, 150, 60, "red_yellow18px");
  armo_sl.setShowValue(true);
  armo_sl.setShowLimits(true);
  armo_sl.setLimits(1, 1, 6);
  armo_sl.setShowTicks(true);
  armo_sl.setEasing(4.0);
  armo_sl.setNumberFormat(G4P.INTEGER, 0);
  armo_sl.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  armo_sl.setOpaque(true);
  armo_sl.addEventHandler(this, "armo_slider");
  tens_sl_2 = new GCustomSlider(Normales, 450, 580, 150, 60, "red_yellow18px");
  tens_sl_2.setShowValue(true);
  tens_sl_2.setShowLimits(true);
  tens_sl_2.setLimits(1.0, 1.0, 25.0);
  tens_sl_2.setShowTicks(true);
  tens_sl_2.setEasing(4.0);
  tens_sl_2.setNumberFormat(G4P.DECIMAL, 0);
  tens_sl_2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  tens_sl_2.setOpaque(true);
  tens_sl_2.addEventHandler(this, "tens_slider_2");
  despau_norm = new GImageButton(Normales, 610, 50, 60, 60, new String[] { "pausa.png", "pausa.png", "pausa.png" } );
  despau_norm.addEventHandler(this, "despausa_normales");
  pau_norm = new GImageButton(Normales, 610, 50, 60, 60, new String[] { "despausa.png", "despausa.png", "despausa.png" } );
  pau_norm.addEventHandler(this, "pausa_normales");
  dens_sl_2 = new GCustomSlider(Normales, 670, 580, 150, 60, "red_yellow18px");
  dens_sl_2.setShowValue(true);
  dens_sl_2.setShowLimits(true);
  dens_sl_2.setLimits(0.1, 0.1, 0.8);
  dens_sl_2.setShowTicks(true);
  dens_sl_2.setEasing(4.0);
  dens_sl_2.setNumberFormat(G4P.DECIMAL, 2);
  dens_sl_2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  dens_sl_2.setOpaque(true);
  dens_sl_2.addEventHandler(this, "niu_slider_2");
  amp_sl_2 = new GCustomSlider(Normales, 910, 580, 150, 60, "red_yellow18px");
  amp_sl_2.setShowValue(true);
  amp_sl_2.setShowLimits(true);
  amp_sl_2.setLimits(1.0, 0.0, 100.0);
  amp_sl_2.setShowTicks(true);
  amp_sl_2.setEasing(4.0);
  amp_sl_2.setNumberFormat(G4P.DECIMAL, 2);
  amp_sl_2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  amp_sl_2.setOpaque(true);
  amp_sl_2.addEventHandler(this, "amp_slider_2");
  UserGUI = GWindow.getWindow(this, "Ingreso Usuario", 0, 0, 1280, 720, JAVA2D);
  UserGUI.noLoop();
  UserGUI.setActionOnClose(G4P.EXIT_APP);
  UserGUI.addDrawHandler(this, "user_draw");
  username = new GTextField(UserGUI, 290, 310, 690, 61, G4P.SCROLLBARS_NONE);
  username.setPromptText("         // Escriba aqui //");
  username.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  username.setOpaque(false);
  username.addEventHandler(this, "adduser");
  agUser = new GImageButton(UserGUI, 569, 497, 115, 105, new String[] { "agoff.png", "agon.png", "agcl.png" } );
  agUser.addEventHandler(this, "Agregar_y_Jugar");
  Leaderboard = GWindow.getWindow(this, "Tablero de puntajes", 0, 0, 1280, 720, JAVA2D);
  Leaderboard.noLoop();
  Leaderboard.setActionOnClose(G4P.EXIT_APP);
  Leaderboard.addDrawHandler(this, "leaderboard_draw");
  b_menu = new GImageButton(Leaderboard, 604, 570, 115, 105, new String[] { "menub.png", "menub2.png", "menub3.png" } );
  b_menu.addEventHandler(this, "ldb_to_menu");
  Simu.loop();
  Instru.loop();
  Juego.loop();
  Puntaje.loop();
  Ayuda.loop();
  Modos.loop();
  Normales.loop();
  UserGUI.loop();
  Leaderboard.loop();
}

// Variable declarations 
// autogenerated do not edit
GImageButton imgButton1; 
GImageButton imgButton2; 
GImageButton ayuda; 
GWindow Simu;
GCustomSlider frec_sl; 
GCustomSlider lon_sl; 
GCustomSlider amp_sl; 
GImageToggleButton mostIncid; 
GImageToggleButton mostRefle; 
GImageButton menuuu; 
GImageButton pau; 
GImageButton reset; 
GImageButton despau; 
GWindow Instru;
GImageButton der; 
GImageButton izq; 
GImageButton b_jugar; 
GWindow Juego;
GButton DecTension; 
GLabel label1; 
GTextArea t_tens; 
GButton b_tens; 
GButton IncTension; 
GLabel label2; 
GButton DecNiu; 
GLabel label3; 
GTextArea t_niu; 
GButton b_niu; 
GButton IncNiu; 
GLabel label4; 
GButton DecAmpl; 
GLabel label5; 
GTextArea t_amp; 
GButton b_amp; 
GButton IncAmpl; 
GLabel label6; 
GImageButton menuu; 
GImageButton verify; 
GWindow Puntaje;
GImageButton b_menuPuntaje; 
GImageButton b_jugarPuntaje; 
GImageButton b_ldb; 
GWindow Ayuda;
GImageButton dere; 
GImageButton izqui; 
GImageButton menub; 
GWindow Modos;
GImageButton norma; 
GImageButton simu; 
GWindow Normales;
GImageButton normal2menu; 
GCustomSlider armo_sl; 
GCustomSlider tens_sl_2; 
GImageButton despau_norm; 
GImageButton pau_norm; 
GCustomSlider dens_sl_2; 
GCustomSlider amp_sl_2; 
GWindow UserGUI;
GTextField username; 
GImageButton agUser; 
GWindow Leaderboard;
GImageButton b_menu; 

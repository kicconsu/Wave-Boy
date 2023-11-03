// algo
import java.awt.Font;
import java.awt.*;

// Sonidos
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer ring;
AudioSample bombo;
AudioSample btn;
AudioSample btn2;
AudioSample verifi;
AudioSample alarm;

// GUI
import g4p_controls.*;

// Formato Decimal
import java.text.DecimalFormat;

// Timer
Timer startTimer;
TimerPuntaje startTimerPuntaje;

// Imagenes

int pum, pumindex = 0, bor, ampindex = 0, tensindex = 0, menuindex =  0;

PImage fondo, mano, manoindice, pantalla, menu, CSJ1, CSJ2, CSJ3,
  frecConst, rod, pun, mod, fondo_armo, userGUI, ldb;

PImage [] gif_menu = new PImage[6];
PImage [] gif_frec_2 =  new PImage[5];
PImage [] gif_frec_1 = new PImage[5];
PImage [] gif_amp = new PImage[14];
PImage [] gif_tens = new PImage[8];
PImage [] gif_niu = new PImage[5];

DecimalFormat df = new DecimalFormat("#.00");
DecimalFormat xd = new DecimalFormat("#0.00");
DecimalFormat dfT = new DecimalFormat("#0.0");
DecimalFormat dfP = new DecimalFormat("#0000");

// Variables Globales

int[][] cuerda;
int[][] cuerdaS;

int[] inY, reY, cuerdaC;

int cpfinal = 0000;

float tens, frec, amp, niu, theta = 0, damp = 0;

int pMax = 65, seg=0, xInicial=100, pointRadius=20, lon,
  puntaje=0000, mostInci=1, mostRefl=1, b, aux, armo;

int p, val_timep = 0, auxtimeI, suma = 0;

float Time, Time2;

float lamb, vel, frecang, k, onInc=0, currentTime = 0, sim_speed = 1, max_dt = (1.0/60.0)*1000;
 
//Modo Juego

int pointRadiusS;

float masS, tensS, frecS, ampS, niuS, lamS, velS, frecangS, kS, auxniuS; // Onda Estacionaria Simulada

// LeaderBoard
int pI = 3, pos = 0;

String[][] UserNScore = new String [2][500];

String auxPuntaje = "";

// TOP 3



// Boton Apagado Prendido

int ApagadoInc = 1, ApagadoRef = 1;

int vv=0, r=0, rr=0, c=0;

String au;


void setup() { // Tamaño del programa e inicializaciones de variables
  size(1280, 720);

  loadMedia();

  setupSimWave();
  setupGameWave();
  setupGameVariables();

  createGUI();

  ring.play();

  Simu.setVisible(false);
  Instru.setVisible(false);
  Juego.setVisible(false);
  Puntaje.setVisible(false);
  Ayuda.setVisible(false);
  Modos.setVisible(false);
  Normales.setVisible(false);
  UserGUI.setVisible(false);
  Leaderboard.setVisible(false);

  Simu.noLoop();
  Instru.noLoop();
  Juego.noLoop();
  Puntaje.noLoop();
  Ayuda.noLoop();
  Modos.noLoop();
  Normales.noLoop();
  UserGUI.noLoop();
  Leaderboard.noLoop();
  
  UserNScore[0][0]="JDR_King";
  UserNScore[1][0]="1500";

  UserNScore[0][1]="FatiGod";
  UserNScore[1][1]="1250";

  UserNScore[0][2]="Crymuel";
  UserNScore[1][2]="2";
  
  for(int i = 3; i<500; i++){
    UserNScore[0][i]="Jugador No."+(i+1);
    UserNScore[1][i]="0";

  }
  

}

void draw() {
  // GUI
  indice();
  image(gif_menu[menuindex], 0, 0);
  if (Simu.isVisible()) {
    //Subrutina de calculos de simulacion -- realizada en intervalos regulares
    float deltaTime = getFrameTime(currentTime);
    //float dt_min = (1.0/(60.0*sqrt(tens/niu)*sim_speed));

    currentTime = millis();


    while (deltaTime > 0) {
      float time_step = min(new float[]{deltaTime, max_dt});
      oscilateSim(sim_speed);
      refresh();
      deltaTime-= time_step;
    }
  } else if (Juego.isVisible()) {
    //Subrutina del calculo de la onda del jugador
    gameWaveRefresh();
    //Subrutina del calculo de la onda de la computadora
    gameWaveSimulada();
  }
}

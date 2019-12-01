import processing.net.*;
Server server;

String incomingMessage = "";
int[][] arr= new int[100][2];
//int[] rates={60,, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 65, 50, 100, 05, 65, 50,25,15};
int[] rates={60, 25, 55, 85, 50, 40, 60, 75, 90, 10, 110, 12, 13, 100, 15, 16, 17, 135, 19, 20, 55, 22, 45, 24, 25, 35, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 79, 120, 79, 42, 40, 98, 44, 45, 46, 45, 48, 66, 50, 95, 99, 55, 90, 55, 50, 100, 45, 60, 15, 60, 23, 10, 05};

String[] menu={"CHILLI POTATO", "BURGER", "CHOWMIEN", "MUNCHURIAN", "VEG MOMOS(FULL)", "VEG MOMOS(HALF)", "NON-VEG MOMOS(FULL)", "NON-VEG MOMOS(HALF)", "PANEER TIKKA", "VEG ROLL", "CHICKEN ROLL", "PANEER ROLL"
  , "KADAI PANEER(HALF)", "KADAI PANEER(FULL)", "SHAHI PANEER(HALF)", "SHAHI PANEER(FULL)", "DAL MAKHANI(HALF)", "DAL MAKHANI(FULL)", "PANEER KORMA(HALF)", "PANEER KORMA(FULL)", "MALAI KOFTA", "DAHI BHALLE"
  , "CHICKEN CHANGEZI(HALF)", "CHICKEN CHANGEZI(FULL)", "CHICKEN KORMA(HALF)", "CHICKEN KORMA(FULL)", "BUTTER CHICKEN(HALF)", "BUTTER CHICKEN(FULL)", "MUTTON KORMA(HALF)", "MUTTON KORMA(FULL)", "BIRYANI(HALF)", "BIRYANI(FULL)"
  , "TAWA ROTI", "TANDOORI ROTI(BUTTER)", "TANDOORI ROTI", "BUTTER NAAN", "MISSI ROTI", "RUMALI ROTI", "LACCHA PARATHA", "ALOO PARATHA", "PANER PARATHA", "MIX PARATHA", "BOONDI RAITA", "PINEAPPLE RAITA", 
  "COLD DRINK(COKE/FANTA/LIMCA)", "RED BULL", "COFFEE", "TEA", "COLD COFFEE", "MOCKTAIL", "COCKTAIL", "GULAB JAMUN", "RASMALAI", "GAJAR KA HALWA", "CHOCOLATE PASTRY", "VANILLA PASTRY", "CHOCOLAVA CAKE", "CUSTARD", "ICE CREAM(VANILLA/STRAWBERRY/CHOCOLATE)"
  , "INDIAN SALAD", "AMERICAN SALAD", "EUROPIAN SALAD", "MEXICAN SALAD", "THAI SALAD"} ;

void setup() {
  size(1890, 980);
  server = new Server(this, 5204);
}

void draw() {

  Client client = server.available();
  if (client != null) {
    incomingMessage = client.readString(); 
    int len=incomingMessage.length();
    int i=1;
    int p=0;
    while (i<len)
    {
      if (incomingMessage.charAt(i)=='[')
      {
        String no="";
        String no1="";
        i++;
        while (incomingMessage.charAt(i)!=',')
        {
          no=no+incomingMessage.charAt(i); 
          i++;
        }
        int k = Integer.parseInt(no);

        i=i+2;
        while (incomingMessage.charAt(i)!=']')
        {
          no1=no1+incomingMessage.charAt(i); 
          i++;
        }
        int k1 = Integer.parseInt(no1);
        if (k!=-1)
        {
          arr[p][0]=k;
          arr[p][1]=k1;
          p++;
        }
      }
      i++;
    }
    screen2(p,arr);
  }
}
void screen2(int k, int[][] arr)
{ 
  int amount=0;
  for (int i=0; i<k; i++)
  {
    amount=amount+rates[int(arr[i][0])]*int(arr[i][1]);
  }
  int y=130;
  background(0, 0, 0);
  stroke(10, 210, 45);
  line(0, 70, 1890, 70);
  line(0, 100, 1890, 100);
  line(0, 910, 1890, 910);
  line(0, 970, 1890, 970);
  stroke(125, 156, 76);
  line(5, 70, 5, 910);
  line(100, 70, 100, 910);
  line(1000, 70, 1000, 910);
  line(1200, 70, 1200, 970);
  line(1880, 70, 1880, 970);
  textSize(25);
  fill(112, 156, 178);
  text("S.No.", 20, 95);
  text("ITEMS   ORDERED", 370, 95);
  text("QUANTITY", 1040, 95);
  text("PRICE   (INCLUDING ALL TAXES)", 1370, 95);
  textSize(50);
  fill(12, 56, 78);
  text("TOTAL", 1020, 960);
  textSize(70);
  fill(210, 135, 10);
  text("BILL", 820, 55);
  for (int i=0; i<k; i++)
  {
    line(10, y, 1880, y);
    textSize(25);
    fill(112, 156, 178);
    text(i+1, 20, y-5);
    text(menu[int(arr[i][0])], 110, y-5);
    text(int(arr[i][1]), 1010, y-5);
    text(rates[int(arr[i][0])], 1210, y-5);
    text('X', 1310, y-5);
    text(int(arr[i][1]), 1400, y-5);
    text('=', 1510, y-5);
    text((int(arr[i][1])*int(rates[int(arr[i][0])])), 1600, y-5);
    y=y+30;
  }
  textSize(65);
  fill(210, 135, 10);
  text(amount, 1500, 965);
}


// The serverEvent function is called whenever a new client connects.
void serverEvent(Server server, Client client) {
  incomingMessage = "There Is A New Costumer -" + client.ip();
  fill(0, 0, 0);
  textSize(50);
  text(incomingMessage, 100, 100);
}

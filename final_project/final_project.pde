import processing.net.*;
import java.util.Arrays; 
Client client;

int[] arrx=new int[100];
int[] arry=new int[100];
int k=0;
int amount =0;
int[] j=new int[100];
int[] f=new int[100];
int[][] arr= new int[100][2];
int[] rates={60, 25, 55, 85, 50, 40, 60, 75, 90, 10, 110, 12, 13, 100, 15, 16, 17, 135, 19, 20, 55, 22, 45, 24, 25, 35, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 79, 120, 79, 42, 40, 98, 44, 45, 46, 45, 48, 66, 50, 95, 99, 55, 90, 55, 50, 100, 45, 60, 15, 60, 23, 10, 05};
String[] menu={"CHILLI POTATO", "BURGER", "CHOWMIEN", "MUNCHURIAN", "VEG MOMOS(FULL)", "VEG MOMOS(HALF)", "NON-VEG MOMOS(FULL)", "NON-VEG MOMOS(HALF)", "PANEER TIKKA", "VEG ROLL", "CHICKEN ROLL", "PANEER ROLL"
  , "KADAI PANEER(HALF)", "KADAI PANEER(FULL)", "SHAHI PANEER(HALF)", "SHAHI PANEER(FULL)", "DAL MAKHANI(HALF)", "DAL MAKHANI(FULL)", "PANEER KORMA(HALF)", "PANEER KORMA(FULL)", "MALAI KOFTA", "DAHI BHALLE"
  , "CHICKEN CHANGEZI(HALF)", "CHICKEN CHANGEZI(FULL)", "CHICKEN KORMA(HALF)", "CHICKEN KORMA(FULL)", "BUTTER CHICKEN(HALF)", "BUTTER CHICKEN(FULL)", "MUTTON KORMA(HALF)", "MUTTON KORMA(FULL)", "BIRYANI(HALF)", "BIRYANI(FULL)"
  , "TAWA ROTI", "TANDOORI ROTI(BUTTER)", "TANDOORI ROTI", "BUTTER NAAN", "MISSI ROTI", "RUMALI ROTI", "LACCHA PARATHA", "ALOO PARATHA", "PANER PARATHA", "MIX PARATHA", "BOONDI RAITA", "PINEAPPLE RAITA", 
  "COLD DRINK(COKE/FANTA/LIMCA)", "RED BULL", "COFFEE", "TEA", "COLD COFFEE", "MOCKTAIL", "COCKTAIL", "GULAB JAMUN", "RASMALAI", "GAJAR KA HALWA", "CHOCOLATE PASTRY", "VANILLA PASTRY", "CHOCOLAVA CAKE", "CUSTARD", "ICE CREAM(VANILLA/STRAWBERRY/CHOCOLATE)"
  , "INDIAN SALAD", "AMERICAN SALAD", "EUROPIAN SALAD", "MEXICAN SALAD", "THAI SALAD"} ;
int flag=1;
int l=0;
int h=0;
void setup() {
  size(1890, 980);
  client = new Client(this, "192.168.43.138", 5204);
  background(0, 0, 0);
  for (int i=0; i<100; i++)
  {
    j[i]=-1;
    f[i]=-1;
  }
}
void draw()
{


  if (flag==2) {

    int i=0;
    int p=0;
    int[] f=new int[100];
    for (int w=0; w<100; w++)
    {
      f[w]=-1;
    }
   
    for (int w=0; w<100; w++)
    {
      arr[w][0]=-1;
      arr[w][1]=-1;
    }
    while (j[i]!=-1)
    { 
      int num=0;
      int flag1=0;
      int k=0;
      while (f[k]!=-1)
      {
        if (f[k]==j[i])
        {
          flag1=1;
        }
        k++;
      }
      if (flag1==0)
      {
        f[p]=j[i];
        k=0;
        while (j[k]!=-1)
        {
          if (j[k]==j[i])
          {
            num++;
          }
          k++;
        }
        arr[p][0]=j[i];
        arr[p][1]=num;
        p++;
      }
      i++;
    }
    if (h==0)
    {
      if (p<=27)
      {
        screen2(p, arr);
        h++;
      }
    }
  } else if (flag==1) {
    int i=0;

    if (k==0)
    {
      screen(k);
    }
    if (j[0]==-1)
    { 
      stroke(0); 
      fill(0, 0, 0);
      rect(1550, 890, 1890, 960);
      fill(120, 10, 13);
      textSize(60);
      text("0", 1550, 940);
    }
    while (j[i]!=-1)
    {
      rectangle_new1(j[i]);
      menu(j[i]);
      i=i+1;
      stroke(0);
      fill(0, 0, 0);
      rect(1550, 890, 1890, 960);
      fill(70, 0, 209);
      textSize(60);
      text(amount, 1550, 940);
    }
  }
}

void screen2(int k, int[][] arr)
{ 
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

void screen(int k)
{
  background(0, 0, 0);
  stroke(90, 89, 67);
  line(0, 90, 1890, 90);
  line(0, 100, 1890, 100);
  line(10, 100, 10, 860);
  line(630, 100, 630, 860);
  line(1260, 100, 1260, 860);
  line(1885, 100, 1885, 860);
  textSize(100);
  fill(120, 60, 90);
  text("MENU", 800, 85);
  textSize(60);
  fill(70, 164, 78);
  text("TOTAL AMOUNT :", 1000, 940);
  textSize(20);
  text("(INCLUSIVE OF ALL TAXES)", 1200, 960);
  textSize(40);
  fill(45, 90, 185);
  text("SNACKS", 15, 140);
  text("MAIN COURSE( NON-VEG )", 635, 140);
  text("ROTI/PARATHE/RAITA", 635, 490);
  text("MAIN COURSE( VEG )", 15, 550);
  text("BEVERAGES", 1265, 140);
  text("DESSERT", 1265, 400);
  text("SALADS", 1265, 690);
  int i=0;
  int y=100;
  int j=1;
  int l=0;
  for (i=0; i<=23; i++)
  {
    if (i==0 ||i==13) {
      y=y+50;
      stroke(23, 89, 144);
      line(10, y, 630, y);
      j=1;
    } else {
      arrx[l]=60;
      arry[l]=y;
      y=y+30;
      line(60, y-30, 60, y);
      line(550, y-30, 550, y);
      textSize(20);
      fill(220, 89, 210);
      text(menu[l], 70, y-5);
      fill(140, 65, 22);
      text(j, 15, y-5);
      fill(190, 200, 30);
      text(rates[l], 570, y-5);
      stroke(55, 67, 189);
      line(10, y, 630, y);
      j++;
      l++;
    }
  }
  i=0;
  y=100;
  j=1;
  for (i=0; i<=23; i++)
  {
    if (i==0 ||i==11) {
      y=y+50;
      stroke(23, 89, 144);
      line(630, y, 1260, y);
      j=1;
    } else {
      arrx[l]=680;
      arry[l]=y;
      y=y+30;
      line(680, y-30, 680, y);
      line(1170, y-30, 1170, y);
      textSize(20);
      fill(220, 89, 210);
      text(menu[l], 690, y-5);
      fill(140, 65, 22);
      text(j, 640, y-5);
      fill(190, 200, 30);
      text(rates[l], 1190, y-5);
      stroke(55, 67, 189);
      line(630, y, 1260, y);
      j++;

      l++;
    }
  }
  i=0;
  y=100;
  j=1;
  for (i=0; i<=22; i++)
  {
    if (i==0 ||i==8||i==17) {
      y=y+50;
      stroke(23, 89, 144);
      line(1260, y, 1985, y);
      j=1;
    } else {
      arrx[l]=1310;
      arry[l]=y;
      y=y+30;
      line(1310, y-30, 1310, y);
      line(1800, y-30, 1800, y);
      textSize(20);
      fill(220, 89, 210);
      text(menu[l], 1320, y-5);
      fill(140, 65, 22);
      text(j, 1265, y-5);
      fill(190, 200, 30);
      text(rates[l], 1820, y-5);
      stroke(55, 67, 189);
      line(1260, y, 1985, y);
      j++;

      l++;
    }
  }
  stroke(90, 89, 67);
  line(0, 860, 1890, 860);
  line(0, 870, 1890, 870);
  rectangle_new(k);
  menu(k);
}
void rectangle_new(int k) {
  stroke(55, 67, 189);
  fill(100, 12, 145);

  rect(arrx[k], arry[k], 490, 30,50);
}
void rectangle_new1(int k) {
  // stroke(55, 67, 189);
  fill(120, 100, 145);
  rect(arrx[k], arry[k], 490, 30,50);
}
void rectangle_0(int k) {
  stroke(55, 67, 189);
  fill(0, 0, 0);
  rect(arrx[k], arry[k], 490, 30);
}
void menu(int k) {
  textSize(20);
  fill(220, 89, 210);
  text(menu[k], arrx[k]+10, arry[k]+25);
}
void keyPressed() {
  if (flag==1)
  {
    if (key=='w' || key=='W')
    {
      if (k!=0) {
        rectangle_0(k);
        menu(k);
        k=k-1;
        rectangle_new(k);
        menu(k);
      }
    } else if (key=='s'||key=='S')
    {
      if (k!=63) {
        rectangle_0(k);
        menu(k);
        k=k+1;
        rectangle_new(k);
        menu(k);
      }
    } else if (key=='d'||key=='D')
    {
      if (k<22) {
        rectangle_0(k);
        menu(k);
        k=22;
        rectangle_new(k);
        menu(k);
      } else if (k<44)
      {
        rectangle_0(k);
        menu(k);
        k=44;
        rectangle_new(k);
        menu(k);
      }
    } else if (key=='a'||key=='A')
    {
      if (k>21 && k<44) {
        rectangle_0(k);
        menu(k);
        k=0;
        rectangle_new(k);
        menu(k);
      } else if (k>44)
      {
        rectangle_0(k);
        menu(k);
        k=22;
        rectangle_new(k);
        menu(k);
      }
    }
    if (key=='h'||key=='H')
    {
      j[l]=k;
      amount=amount+rates[k];



      l=l+1;
    }
    if (key=='j'||key=='J')
    { 
      rectangle_new(k);
      menu(k);
      int i=0;
      while (j[i]!=-1)
      {
        if (j[i]==k) {
          amount=amount-rates[k];


          l=l-1;
          while (j[i]!=-1)
          {
            j[i]=j[i+1];
            i=i+1;
          }
        }
        i=i+1;
      }
    }
  }
  if (key=='b'||key=='B') {
    if (flag==2)
    {
      flag=1;
      k=0;
    }
  }
  if (key=='P'||key=='p') {
    if (flag==1 && j[0]!=-1)
    {

      flag=2;
      h=0;
    }
  }
  if (key=='F'||key=='f') {
    if (flag==2 )
    {
   
   client.write(Arrays.deepToString(arr));
   flag=3;
   textSize(50);
    fill(12, 56, 78);
    text("ORDER PLACED", 400, 960);
   
   for (int i=0; i<100; i++)
  {
    j[i]=-1;
    f[i]=-1;
  }
    for (int w=0; w<100; w++)
    {
      arr[w][0]=-1;
      arr[w][1]=-1;
    }
    k=0;
    l=0;
    h=0;
    amount=0;
     int time=millis();
 while (millis()<(time+10000))
  {
     
  }
    flag=1;
   
    }
  }
}

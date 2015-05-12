// Сборная солянка. Первая версия, как вызвать системную команду установки частоты. 
// Вторая версия, как в файле config поменять период в четырех строчках. 
// Третье - уже встречавшаяся программка на работу с потоками, подруливанием одним колесом и снятием значений с другого колеса.



var motorNums = {"0x10"; ..} 
    var freqDiv;
	for (freqDiv = ...;freqDiv <= ...; freqDiv *= 1.2)
    {
        var command = "i2cset -y 2 0x48 0x10 0x" + freqDiv.toString(16) + " w";
        print(command);          
        script.system(command);
        script.wait(2000);
        .....
    }




#!/bin/bash
for i in {1..10}
do
  h=0x`echo "obase=16; $i" | bc`
  echo $h	

  cat system-config.xml | sed "s/0xFFFF/$h/g" > system-config2.xml
  chmod +x trikRun 
  ./trikRun -qws ./scripts/checkin.qts 
done




var __interpretation_started_timestamp__;

var pi = 3.14159265;

var e3 =  brick.encoder(B1);

var e4 =  brick.encoder(B4);

var init = -100;

;

/* Threads declarations */

var first;



var m3 = brick.motor(M1);

var m4 = brick.motor(M4);





/* Threads */

first = function()

{

	

var diffPrev;

	while(1){

	//brick.encoder(B3).reset();

	//brick.encoder(B4).reset();

	p = - m3.power();

	diff = (e4.readRawData() + e3.readRawData()) ;

	

	

	power = p  + 2*diff - 1*(diff - diffPrev) + 0.5*(diffPrev+diff);

	m4.setPower(power);

	

	//print ("power",  power, "p", p , "diff", diff);

	diffPrev = diff;

	

	script.wait(20);

		}

	return;

}



var main = function()

{

	__interpretation_started_timestamp__ = Date.now();

	e3.reset();

	e4.reset();

	var enprev3 = 0;

	var enprev4 = 0;

	Threading.start("first");

	script.wait(2000);

	

	while (init <105) {

		for (i = 0; i <5; i++)

			init ++;

	m3.setPower(init);

	script.wait(5000);



	print("power", m3.power(),"encoders",(e3.readRawData() - enprev3), ',',( e4.readRawData()-enprev4));

	enprev3 = e3.readRawData();

	enprev4 = e4.readRawData();

	}

	return;

}
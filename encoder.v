`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:37:20 01/16/2017 
// Design Name: 
// Module Name:    encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module encoder(DOUT,DIN,CLK,RST,KIN);
	input[7:0] DIN;
	input RST,CLK,KIN;
	output reg[9:0] DOUT;
	reg [2:0] din3;
	reg [4:0] din5;
	reg [3:0]i;
	reg [2:0]count0,count1;
	reg[3:0] dout;
	reg[5:0] dout5;
	reg rd;
	parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,s10=10,s11=11,s12=12,s13=13,s14=14,s15=15,s16=16,s17=17,s18=18,s19=19,s20=20,s21=21,s22=22,s23=23,s24=24,s25=25,s26=26,s27=27,s28=28,s29=29,s30=30,s31=31;

	always@(posedge CLK,posedge RST)
	begin
		if(RST)
		begin
			rd<=1;
			count1<=0;
			count0<=0;
			DOUT <= 0;
		end 
		else
		begin
			din3<=DIN[7:5];
			din5<=DIN[4:0]; 
			if(KIN==0) 
			begin
// 3_4 bit encoder.  
			case(din3)
				s0: if(rd)
				dout<=0100;
				else
				dout<=1011;
				s1:  dout<=1001;
				s2:  dout<=0101;
				s3: if(rd)
				dout<=0011;
				else
				dout<=1100;
				s4: if(rd)
				dout<=0010;
				else
				dout<=1101;
				s5:  dout<=1010;
				s6:  dout<=0110;
				s7: if(rd)
				dout<=0001;
				else
				dout<=1110;
		endcase
//5_6 bit encoder.	 
		case(din5)
			s0:if(rd==0)
				dout5<= 100111;
				else
	         dout5<=011000;
			s1:if(rd==0) 
				dout5<= 011101;
				else 
				dout5<= 100010;
			s2:if(rd==0)
            dout5<= 101101;
				else
    		   dout5<= 010010;
			s3:dout5<=110001;
			s4:if(rd==0)
				dout5<=110101; 
				else
            dout5<=001010;
			s5:dout5<=101001;
			s6:dout5<=011001;
			s7:if(rd==0)
				dout5<=111000;
				else
            dout5<=000111;
			s8:if(rd==0)
            dout5<=111001;
				else
	         dout5<=000110;
			s9:dout5<=100101;
			s10:dout5<=010101;
			s11:dout5<=110100;
			s12:dout5<=001101;
			s13:dout5<=001100;
			s14:dout5<=011100;
			s15:if(rd==0)
				 dout5<= 010111;
				 else
	          dout5<=101000;
			s16:if(rd==0)
             dout5<= 011011;
	          else
	          dout5<=100100;
			s17:dout5<=100011;
			s18:dout5<=010011;
			s19:dout5<=110010;
			s20:dout5<=001011;
			s21:dout5<=101010;
			s22:dout5<=011010;
			s23:if(rd==0)
             dout5<= 111010;
				 else
	          dout5<=000101;
			s24:if(rd==0)
             dout5<= 110011;
				 else
	          dout5<=001100;
         s25:dout5<=100110;
         s26:dout5<=010110;
			s27:if(rd==0)
             dout5<= 110110;
	          else
	          dout5<=001001;
			s28:dout5<=001110;
			s29:if(rd==0)
				 dout5<= 101110;
	          else
	          dout5<=010001;
			s30:if(rd==0)
             dout5<= 011110;
	          else
	          dout5<=100001;
			s31:if(rd==0)
             dout5<= 101011;
	          else
	          dout5<=010100;
		endcase
	end
	else
	begin
		case(din3)
		s0: if(rd)
          dout<=0100;
	       else
          dout<=1011;
		s1: if(rd)
	       dout<=1001;
			 else
          dout<=0110;			 
      s2: if(rd)
	       dout<=0101;
			 else
          dout<=1010;			 
      s3: if(rd)
          dout<=0011;
	       else
          dout<=1100;
      s4: if(rd)
          dout<=0010;
	       else
          dout<=1101;
      s5: if(rd)
	       dout<=1010;
			 else
          dout<=0101;			  
		s6: if(rd)
	       dout<=0110;
			 else
          dout<=1001;			 
		s7: if(rd)
          dout<=1000;
	       else
          dout<=0111;
    endcase
	 case(din5)
		s28: if(rd)
	        dout5<=001111;
	  	     else
           dout5<=110000;
		s23: if(rd)
           dout5<=111010;
           else
           dout5<=000101;
		s27: if(rd)
           dout5<=110110;
           else
           dout5<=001001;
		s29: if(rd)
           dout5<=101110;
           else
       	  dout5<=010001;
      s30: if(rd)
           dout5<=011110;
           else
           dout5<=100001;
    endcase	
   end	 
  DOUT[9:4]<=dout5;
  DOUT[3:0]<=dout;
	for(i=0;i<10;i=i+1)
	begin
	 if(DOUT[i]==1'b0)
	  count0<=count0+1'b1;
	 else
     count1<=count1+1'b1;
   end
	if(count0==count1)
		rd<=rd;
	else
		rd<=~rd; 	
	end
	end
endmodule
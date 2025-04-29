module NAND_Only (a,b,c,d,f
);
input a,b,c,d;
output f;
wire i,j,k,l,m,o;
not not1(i,a);
not not2(j,b);
not not3(m,d);
and and1(k,i,j);
and and2(l,a,d);
and and3(o,i,b,c,m);
or or1(f,k,l,o);
    
endmodule
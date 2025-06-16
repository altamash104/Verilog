//////////////Method-1/////////////////
module matrix;
  
  int a[4][4]='{ '{1,2,3,4}, '{5,6,7,8}, '{9,10,11,12},'{13,14,15,16}};
  
  initial
    begin
      for(int i=0;i<4;i++)
        begin
          for(int j=0;j<4;j++)
            begin
              $write("%0d",a[i][j]);
            end
          $display("");
    end
  end
endmodule

///////////////////Method-2///////////////////

module matrix;
  int a[4][4]='{ '{1,2,3,4}, '{5,6,7,8}, '{9,10,11,12},'{13,14,15,16}};
  
  initial
    begin
  	foreach(a[i])
    begin
      foreach(a[j])
        begin
          $write("%0d",a[i][j]);
        end
          $display("");
    end
    end
endmodule

//////////////////Method-3//////////////
module matrix;
  int a[4][4]='{ '{1,2,3,4}, '{5,6,7,8}, '{9,10,11,12},'{13,14,15,16}};
  
  initial
    begin
  	foreach(a[i])
      begin
      foreach(a[i][j])
        begin
          $write("%0d",a[i][j]);
        end
          $display("");
      end
    end
endmodule


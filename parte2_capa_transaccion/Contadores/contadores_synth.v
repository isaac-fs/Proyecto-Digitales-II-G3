/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "contadores_synth.v:1" *)
module contadores_synth(clk, rst_l, req, pop_0, pop_1, pop_2, pop_3, idx, idle, empty_FIFO_0, empty_FIFO_1, empty_FIFO_2, empty_FIFO_3, data, valid);
  (* src = "contadores_synth.v:31" *)
  wire [5:0] _000_;
  (* src = "contadores_synth.v:31" *)
  wire [5:0] _001_;
  (* src = "contadores_synth.v:31" *)
  wire [5:0] _002_;
  (* src = "contadores_synth.v:31" *)
  wire [5:0] _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  (* src = "contadores_synth.v:2" *)
  input clk;
  (* src = "contadores_synth.v:1" *)
  wire [5:0] \contador[0] ;
  (* src = "contadores_synth.v:1" *)
  wire [5:0] \contador[1] ;
  (* src = "contadores_synth.v:1" *)
  wire [5:0] \contador[2] ;
  (* src = "contadores_synth.v:1" *)
  wire [5:0] \contador[3] ;
  (* src = "contadores_synth.v:16" *)
  output [5:0] data;
  (* src = "contadores_synth.v:12" *)
  input empty_FIFO_0;
  (* src = "contadores_synth.v:13" *)
  input empty_FIFO_1;
  (* src = "contadores_synth.v:14" *)
  input empty_FIFO_2;
  (* src = "contadores_synth.v:15" *)
  input empty_FIFO_3;
  (* src = "contadores_synth.v:30" *)
  wire [31:0] i;
  (* src = "contadores_synth.v:10" *)
  input idle;
  (* src = "contadores_synth.v:9" *)
  input [1:0] idx;
  (* src = "contadores_synth.v:5" *)
  input pop_0;
  (* src = "contadores_synth.v:6" *)
  input pop_1;
  (* src = "contadores_synth.v:7" *)
  input pop_2;
  (* src = "contadores_synth.v:8" *)
  input pop_3;
  (* src = "contadores_synth.v:4" *)
  input req;
  (* src = "contadores_synth.v:3" *)
  input rst_l;
  (* src = "contadores_synth.v:17" *)
  output valid;
  NOT _181_ (
    .A(\contador[3] [5]),
    .Y(_150_)
  );
  NOT _182_ (
    .A(\contador[3] [4]),
    .Y(_151_)
  );
  NOT _183_ (
    .A(\contador[3] [3]),
    .Y(_152_)
  );
  NOT _184_ (
    .A(\contador[3] [2]),
    .Y(_153_)
  );
  NOT _185_ (
    .A(\contador[3] [1]),
    .Y(_154_)
  );
  NOT _186_ (
    .A(\contador[3] [0]),
    .Y(_155_)
  );
  NOT _187_ (
    .A(\contador[2] [5]),
    .Y(_156_)
  );
  NOT _188_ (
    .A(\contador[2] [4]),
    .Y(_157_)
  );
  NOT _189_ (
    .A(\contador[2] [3]),
    .Y(_158_)
  );
  NOT _190_ (
    .A(\contador[2] [2]),
    .Y(_159_)
  );
  NOT _191_ (
    .A(\contador[2] [1]),
    .Y(_160_)
  );
  NOT _192_ (
    .A(\contador[2] [0]),
    .Y(_161_)
  );
  NOT _193_ (
    .A(\contador[1] [5]),
    .Y(_162_)
  );
  NOT _194_ (
    .A(\contador[1] [4]),
    .Y(_163_)
  );
  NOT _195_ (
    .A(\contador[1] [3]),
    .Y(_164_)
  );
  NOT _196_ (
    .A(\contador[1] [2]),
    .Y(_165_)
  );
  NOT _197_ (
    .A(\contador[1] [1]),
    .Y(_166_)
  );
  NOT _198_ (
    .A(\contador[1] [0]),
    .Y(_167_)
  );
  NOT _199_ (
    .A(\contador[0] [5]),
    .Y(_168_)
  );
  NOT _200_ (
    .A(\contador[0] [4]),
    .Y(_169_)
  );
  NOT _201_ (
    .A(\contador[0] [3]),
    .Y(_170_)
  );
  NOT _202_ (
    .A(\contador[0] [2]),
    .Y(_171_)
  );
  NOT _203_ (
    .A(\contador[0] [1]),
    .Y(_172_)
  );
  NOT _204_ (
    .A(\contador[0] [0]),
    .Y(_173_)
  );
  NOT _205_ (
    .A(idx[0]),
    .Y(_174_)
  );
  NOT _206_ (
    .A(idx[1]),
    .Y(_175_)
  );
  NOT _207_ (
    .A(pop_0),
    .Y(_176_)
  );
  NOT _208_ (
    .A(pop_1),
    .Y(_177_)
  );
  NOT _209_ (
    .A(pop_2),
    .Y(_178_)
  );
  NOT _210_ (
    .A(pop_3),
    .Y(_179_)
  );
  NOR _211_ (
    .A(_176_),
    .B(empty_FIFO_0),
    .Y(_180_)
  );
  NOT _212_ (
    .A(_180_),
    .Y(_004_)
  );
  NOR _213_ (
    .A(_173_),
    .B(_004_),
    .Y(_005_)
  );
  NAND _214_ (
    .A(\contador[0] [0]),
    .B(_180_),
    .Y(_006_)
  );
  NOR _215_ (
    .A(_172_),
    .B(_006_),
    .Y(_007_)
  );
  NAND _216_ (
    .A(\contador[0] [1]),
    .B(_005_),
    .Y(_008_)
  );
  NOR _217_ (
    .A(_171_),
    .B(_008_),
    .Y(_009_)
  );
  NAND _218_ (
    .A(\contador[0] [2]),
    .B(_007_),
    .Y(_010_)
  );
  NOR _219_ (
    .A(_170_),
    .B(_010_),
    .Y(_011_)
  );
  NAND _220_ (
    .A(\contador[0] [3]),
    .B(_009_),
    .Y(_012_)
  );
  NOR _221_ (
    .A(_169_),
    .B(_012_),
    .Y(_013_)
  );
  NAND _222_ (
    .A(\contador[0] [4]),
    .B(_011_),
    .Y(_014_)
  );
  NAND _223_ (
    .A(_169_),
    .B(_012_),
    .Y(_015_)
  );
  NAND _224_ (
    .A(rst_l),
    .B(_015_),
    .Y(_016_)
  );
  NOR _225_ (
    .A(_013_),
    .B(_016_),
    .Y(_000_[4])
  );
  NAND _226_ (
    .A(_170_),
    .B(_010_),
    .Y(_017_)
  );
  NAND _227_ (
    .A(rst_l),
    .B(_017_),
    .Y(_018_)
  );
  NOR _228_ (
    .A(_011_),
    .B(_018_),
    .Y(_000_[3])
  );
  NOR _229_ (
    .A(\contador[0] [2]),
    .B(_007_),
    .Y(_019_)
  );
  NAND _230_ (
    .A(rst_l),
    .B(_010_),
    .Y(_020_)
  );
  NOR _231_ (
    .A(_019_),
    .B(_020_),
    .Y(_000_[2])
  );
  NAND _232_ (
    .A(_172_),
    .B(_006_),
    .Y(_021_)
  );
  NAND _233_ (
    .A(rst_l),
    .B(_021_),
    .Y(_022_)
  );
  NOR _234_ (
    .A(_007_),
    .B(_022_),
    .Y(_000_[1])
  );
  NOR _235_ (
    .A(\contador[0] [0]),
    .B(_180_),
    .Y(_023_)
  );
  NAND _236_ (
    .A(rst_l),
    .B(_006_),
    .Y(_024_)
  );
  NOR _237_ (
    .A(_023_),
    .B(_024_),
    .Y(_000_[0])
  );
  NOR _238_ (
    .A(_177_),
    .B(empty_FIFO_1),
    .Y(_025_)
  );
  NOT _239_ (
    .A(_025_),
    .Y(_026_)
  );
  NOR _240_ (
    .A(_167_),
    .B(_026_),
    .Y(_027_)
  );
  NAND _241_ (
    .A(\contador[1] [0]),
    .B(_025_),
    .Y(_028_)
  );
  NOR _242_ (
    .A(_166_),
    .B(_028_),
    .Y(_029_)
  );
  NAND _243_ (
    .A(\contador[1] [1]),
    .B(_027_),
    .Y(_030_)
  );
  NOR _244_ (
    .A(_165_),
    .B(_030_),
    .Y(_031_)
  );
  NAND _245_ (
    .A(\contador[1] [2]),
    .B(_029_),
    .Y(_032_)
  );
  NOR _246_ (
    .A(_164_),
    .B(_032_),
    .Y(_033_)
  );
  NAND _247_ (
    .A(\contador[1] [3]),
    .B(_031_),
    .Y(_034_)
  );
  NOR _248_ (
    .A(_163_),
    .B(_034_),
    .Y(_035_)
  );
  NAND _249_ (
    .A(\contador[1] [4]),
    .B(_033_),
    .Y(_036_)
  );
  NAND _250_ (
    .A(_163_),
    .B(_034_),
    .Y(_037_)
  );
  NAND _251_ (
    .A(rst_l),
    .B(_037_),
    .Y(_038_)
  );
  NOR _252_ (
    .A(_035_),
    .B(_038_),
    .Y(_001_[4])
  );
  NAND _253_ (
    .A(_164_),
    .B(_032_),
    .Y(_039_)
  );
  NAND _254_ (
    .A(rst_l),
    .B(_039_),
    .Y(_040_)
  );
  NOR _255_ (
    .A(_033_),
    .B(_040_),
    .Y(_001_[3])
  );
  NOR _256_ (
    .A(\contador[1] [2]),
    .B(_029_),
    .Y(_041_)
  );
  NAND _257_ (
    .A(rst_l),
    .B(_032_),
    .Y(_042_)
  );
  NOR _258_ (
    .A(_041_),
    .B(_042_),
    .Y(_001_[2])
  );
  NAND _259_ (
    .A(_166_),
    .B(_028_),
    .Y(_043_)
  );
  NAND _260_ (
    .A(rst_l),
    .B(_043_),
    .Y(_044_)
  );
  NOR _261_ (
    .A(_029_),
    .B(_044_),
    .Y(_001_[1])
  );
  NOR _262_ (
    .A(\contador[1] [0]),
    .B(_025_),
    .Y(_045_)
  );
  NAND _263_ (
    .A(rst_l),
    .B(_028_),
    .Y(_046_)
  );
  NOR _264_ (
    .A(_045_),
    .B(_046_),
    .Y(_001_[0])
  );
  NOR _265_ (
    .A(_178_),
    .B(empty_FIFO_2),
    .Y(_047_)
  );
  NOT _266_ (
    .A(_047_),
    .Y(_048_)
  );
  NOR _267_ (
    .A(_161_),
    .B(_048_),
    .Y(_049_)
  );
  NAND _268_ (
    .A(\contador[2] [0]),
    .B(_047_),
    .Y(_050_)
  );
  NOR _269_ (
    .A(_160_),
    .B(_050_),
    .Y(_051_)
  );
  NAND _270_ (
    .A(\contador[2] [1]),
    .B(_049_),
    .Y(_052_)
  );
  NOR _271_ (
    .A(_159_),
    .B(_052_),
    .Y(_053_)
  );
  NAND _272_ (
    .A(\contador[2] [2]),
    .B(_051_),
    .Y(_054_)
  );
  NOR _273_ (
    .A(_158_),
    .B(_054_),
    .Y(_055_)
  );
  NAND _274_ (
    .A(\contador[2] [3]),
    .B(_053_),
    .Y(_056_)
  );
  NOR _275_ (
    .A(_157_),
    .B(_056_),
    .Y(_057_)
  );
  NAND _276_ (
    .A(\contador[2] [4]),
    .B(_055_),
    .Y(_058_)
  );
  NAND _277_ (
    .A(_157_),
    .B(_056_),
    .Y(_059_)
  );
  NAND _278_ (
    .A(rst_l),
    .B(_059_),
    .Y(_060_)
  );
  NOR _279_ (
    .A(_057_),
    .B(_060_),
    .Y(_002_[4])
  );
  NAND _280_ (
    .A(_158_),
    .B(_054_),
    .Y(_061_)
  );
  NAND _281_ (
    .A(rst_l),
    .B(_061_),
    .Y(_062_)
  );
  NOR _282_ (
    .A(_055_),
    .B(_062_),
    .Y(_002_[3])
  );
  NOR _283_ (
    .A(\contador[2] [2]),
    .B(_051_),
    .Y(_063_)
  );
  NAND _284_ (
    .A(rst_l),
    .B(_054_),
    .Y(_064_)
  );
  NOR _285_ (
    .A(_063_),
    .B(_064_),
    .Y(_002_[2])
  );
  NAND _286_ (
    .A(_160_),
    .B(_050_),
    .Y(_065_)
  );
  NAND _287_ (
    .A(rst_l),
    .B(_065_),
    .Y(_066_)
  );
  NOR _288_ (
    .A(_051_),
    .B(_066_),
    .Y(_002_[1])
  );
  NOR _289_ (
    .A(\contador[2] [0]),
    .B(_047_),
    .Y(_067_)
  );
  NAND _290_ (
    .A(rst_l),
    .B(_050_),
    .Y(_068_)
  );
  NOR _291_ (
    .A(_067_),
    .B(_068_),
    .Y(_002_[0])
  );
  NOR _292_ (
    .A(_179_),
    .B(empty_FIFO_3),
    .Y(_069_)
  );
  NOT _293_ (
    .A(_069_),
    .Y(_070_)
  );
  NOR _294_ (
    .A(_155_),
    .B(_070_),
    .Y(_071_)
  );
  NAND _295_ (
    .A(\contador[3] [0]),
    .B(_069_),
    .Y(_072_)
  );
  NOR _296_ (
    .A(_154_),
    .B(_072_),
    .Y(_073_)
  );
  NAND _297_ (
    .A(\contador[3] [1]),
    .B(_071_),
    .Y(_074_)
  );
  NOR _298_ (
    .A(_153_),
    .B(_074_),
    .Y(_075_)
  );
  NAND _299_ (
    .A(\contador[3] [2]),
    .B(_073_),
    .Y(_076_)
  );
  NOR _300_ (
    .A(_152_),
    .B(_076_),
    .Y(_077_)
  );
  NAND _301_ (
    .A(\contador[3] [3]),
    .B(_075_),
    .Y(_078_)
  );
  NOR _302_ (
    .A(_151_),
    .B(_078_),
    .Y(_079_)
  );
  NAND _303_ (
    .A(\contador[3] [4]),
    .B(_077_),
    .Y(_080_)
  );
  NAND _304_ (
    .A(_151_),
    .B(_078_),
    .Y(_081_)
  );
  NAND _305_ (
    .A(rst_l),
    .B(_081_),
    .Y(_082_)
  );
  NOR _306_ (
    .A(_079_),
    .B(_082_),
    .Y(_003_[4])
  );
  NAND _307_ (
    .A(_152_),
    .B(_076_),
    .Y(_083_)
  );
  NAND _308_ (
    .A(rst_l),
    .B(_083_),
    .Y(_084_)
  );
  NOR _309_ (
    .A(_077_),
    .B(_084_),
    .Y(_003_[3])
  );
  NOR _310_ (
    .A(\contador[3] [2]),
    .B(_073_),
    .Y(_085_)
  );
  NAND _311_ (
    .A(rst_l),
    .B(_076_),
    .Y(_086_)
  );
  NOR _312_ (
    .A(_085_),
    .B(_086_),
    .Y(_003_[2])
  );
  NAND _313_ (
    .A(_154_),
    .B(_072_),
    .Y(_087_)
  );
  NAND _314_ (
    .A(rst_l),
    .B(_087_),
    .Y(_088_)
  );
  NOR _315_ (
    .A(_073_),
    .B(_088_),
    .Y(_003_[1])
  );
  NOR _316_ (
    .A(\contador[3] [0]),
    .B(_069_),
    .Y(_089_)
  );
  NAND _317_ (
    .A(rst_l),
    .B(_072_),
    .Y(_090_)
  );
  NOR _318_ (
    .A(_089_),
    .B(_090_),
    .Y(_003_[0])
  );
  NAND _319_ (
    .A(req),
    .B(idle),
    .Y(_091_)
  );
  NOT _320_ (
    .A(_091_),
    .Y(valid)
  );
  NOR _321_ (
    .A(_174_),
    .B(idx[1]),
    .Y(_092_)
  );
  NAND _322_ (
    .A(\contador[1] [4]),
    .B(_092_),
    .Y(_093_)
  );
  NOR _323_ (
    .A(_174_),
    .B(_175_),
    .Y(_094_)
  );
  NAND _324_ (
    .A(\contador[3] [4]),
    .B(_094_),
    .Y(_095_)
  );
  NAND _325_ (
    .A(_093_),
    .B(_095_),
    .Y(_096_)
  );
  NOR _326_ (
    .A(idx[0]),
    .B(_175_),
    .Y(_097_)
  );
  NAND _327_ (
    .A(\contador[2] [4]),
    .B(_097_),
    .Y(_098_)
  );
  NOR _328_ (
    .A(idx[0]),
    .B(idx[1]),
    .Y(_099_)
  );
  NAND _329_ (
    .A(\contador[0] [4]),
    .B(_099_),
    .Y(_100_)
  );
  NAND _330_ (
    .A(_098_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _331_ (
    .A(_096_),
    .B(_101_),
    .Y(_102_)
  );
  NOR _332_ (
    .A(_091_),
    .B(_102_),
    .Y(data[4])
  );
  NAND _333_ (
    .A(\contador[1] [3]),
    .B(_092_),
    .Y(_103_)
  );
  NAND _334_ (
    .A(\contador[3] [3]),
    .B(_094_),
    .Y(_104_)
  );
  NAND _335_ (
    .A(_103_),
    .B(_104_),
    .Y(_105_)
  );
  NAND _336_ (
    .A(\contador[2] [3]),
    .B(_097_),
    .Y(_106_)
  );
  NAND _337_ (
    .A(\contador[0] [3]),
    .B(_099_),
    .Y(_107_)
  );
  NAND _338_ (
    .A(_106_),
    .B(_107_),
    .Y(_108_)
  );
  NOR _339_ (
    .A(_105_),
    .B(_108_),
    .Y(_109_)
  );
  NOR _340_ (
    .A(_091_),
    .B(_109_),
    .Y(data[3])
  );
  NAND _341_ (
    .A(\contador[1] [2]),
    .B(_092_),
    .Y(_110_)
  );
  NAND _342_ (
    .A(\contador[3] [2]),
    .B(_094_),
    .Y(_111_)
  );
  NAND _343_ (
    .A(_110_),
    .B(_111_),
    .Y(_112_)
  );
  NAND _344_ (
    .A(\contador[2] [2]),
    .B(_097_),
    .Y(_113_)
  );
  NAND _345_ (
    .A(\contador[0] [2]),
    .B(_099_),
    .Y(_114_)
  );
  NAND _346_ (
    .A(_113_),
    .B(_114_),
    .Y(_115_)
  );
  NOR _347_ (
    .A(_112_),
    .B(_115_),
    .Y(_116_)
  );
  NOR _348_ (
    .A(_091_),
    .B(_116_),
    .Y(data[2])
  );
  NAND _349_ (
    .A(\contador[1] [1]),
    .B(_092_),
    .Y(_117_)
  );
  NAND _350_ (
    .A(\contador[3] [1]),
    .B(_094_),
    .Y(_118_)
  );
  NAND _351_ (
    .A(_117_),
    .B(_118_),
    .Y(_119_)
  );
  NAND _352_ (
    .A(\contador[2] [1]),
    .B(_097_),
    .Y(_120_)
  );
  NAND _353_ (
    .A(\contador[0] [1]),
    .B(_099_),
    .Y(_121_)
  );
  NAND _354_ (
    .A(_120_),
    .B(_121_),
    .Y(_122_)
  );
  NOR _355_ (
    .A(_119_),
    .B(_122_),
    .Y(_123_)
  );
  NOR _356_ (
    .A(_091_),
    .B(_123_),
    .Y(data[1])
  );
  NAND _357_ (
    .A(\contador[1] [0]),
    .B(_092_),
    .Y(_124_)
  );
  NAND _358_ (
    .A(\contador[3] [0]),
    .B(_094_),
    .Y(_125_)
  );
  NAND _359_ (
    .A(_124_),
    .B(_125_),
    .Y(_126_)
  );
  NAND _360_ (
    .A(\contador[2] [0]),
    .B(_097_),
    .Y(_127_)
  );
  NAND _361_ (
    .A(\contador[0] [0]),
    .B(_099_),
    .Y(_128_)
  );
  NAND _362_ (
    .A(_127_),
    .B(_128_),
    .Y(_129_)
  );
  NOR _363_ (
    .A(_126_),
    .B(_129_),
    .Y(_130_)
  );
  NOR _364_ (
    .A(_091_),
    .B(_130_),
    .Y(data[0])
  );
  NAND _365_ (
    .A(\contador[1] [5]),
    .B(_092_),
    .Y(_131_)
  );
  NAND _366_ (
    .A(\contador[3] [5]),
    .B(_094_),
    .Y(_132_)
  );
  NAND _367_ (
    .A(_131_),
    .B(_132_),
    .Y(_133_)
  );
  NAND _368_ (
    .A(\contador[2] [5]),
    .B(_097_),
    .Y(_134_)
  );
  NAND _369_ (
    .A(\contador[0] [5]),
    .B(_099_),
    .Y(_135_)
  );
  NAND _370_ (
    .A(_134_),
    .B(_135_),
    .Y(_136_)
  );
  NOR _371_ (
    .A(_133_),
    .B(_136_),
    .Y(_137_)
  );
  NOR _372_ (
    .A(_091_),
    .B(_137_),
    .Y(data[5])
  );
  NOR _373_ (
    .A(_150_),
    .B(_080_),
    .Y(_138_)
  );
  NAND _374_ (
    .A(_150_),
    .B(_080_),
    .Y(_139_)
  );
  NAND _375_ (
    .A(rst_l),
    .B(_139_),
    .Y(_140_)
  );
  NOR _376_ (
    .A(_138_),
    .B(_140_),
    .Y(_003_[5])
  );
  NOR _377_ (
    .A(_156_),
    .B(_058_),
    .Y(_141_)
  );
  NAND _378_ (
    .A(_156_),
    .B(_058_),
    .Y(_142_)
  );
  NAND _379_ (
    .A(rst_l),
    .B(_142_),
    .Y(_143_)
  );
  NOR _380_ (
    .A(_141_),
    .B(_143_),
    .Y(_002_[5])
  );
  NOR _381_ (
    .A(_162_),
    .B(_036_),
    .Y(_144_)
  );
  NAND _382_ (
    .A(_162_),
    .B(_036_),
    .Y(_145_)
  );
  NAND _383_ (
    .A(rst_l),
    .B(_145_),
    .Y(_146_)
  );
  NOR _384_ (
    .A(_144_),
    .B(_146_),
    .Y(_001_[5])
  );
  NOR _385_ (
    .A(_168_),
    .B(_014_),
    .Y(_147_)
  );
  NAND _386_ (
    .A(_168_),
    .B(_014_),
    .Y(_148_)
  );
  NAND _387_ (
    .A(rst_l),
    .B(_148_),
    .Y(_149_)
  );
  NOR _388_ (
    .A(_147_),
    .B(_149_),
    .Y(_000_[5])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _389_ (
    .C(clk),
    .D(_000_[0]),
    .Q(\contador[0] [0])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _390_ (
    .C(clk),
    .D(_000_[1]),
    .Q(\contador[0] [1])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _391_ (
    .C(clk),
    .D(_000_[2]),
    .Q(\contador[0] [2])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _392_ (
    .C(clk),
    .D(_000_[3]),
    .Q(\contador[0] [3])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _393_ (
    .C(clk),
    .D(_000_[4]),
    .Q(\contador[0] [4])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _394_ (
    .C(clk),
    .D(_000_[5]),
    .Q(\contador[0] [5])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _395_ (
    .C(clk),
    .D(_001_[0]),
    .Q(\contador[1] [0])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _396_ (
    .C(clk),
    .D(_001_[1]),
    .Q(\contador[1] [1])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _397_ (
    .C(clk),
    .D(_001_[2]),
    .Q(\contador[1] [2])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _398_ (
    .C(clk),
    .D(_001_[3]),
    .Q(\contador[1] [3])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _399_ (
    .C(clk),
    .D(_001_[4]),
    .Q(\contador[1] [4])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _400_ (
    .C(clk),
    .D(_001_[5]),
    .Q(\contador[1] [5])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _401_ (
    .C(clk),
    .D(_002_[0]),
    .Q(\contador[2] [0])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _402_ (
    .C(clk),
    .D(_002_[1]),
    .Q(\contador[2] [1])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _403_ (
    .C(clk),
    .D(_002_[2]),
    .Q(\contador[2] [2])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _404_ (
    .C(clk),
    .D(_002_[3]),
    .Q(\contador[2] [3])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _405_ (
    .C(clk),
    .D(_002_[4]),
    .Q(\contador[2] [4])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _406_ (
    .C(clk),
    .D(_002_[5]),
    .Q(\contador[2] [5])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _407_ (
    .C(clk),
    .D(_003_[0]),
    .Q(\contador[3] [0])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _408_ (
    .C(clk),
    .D(_003_[1]),
    .Q(\contador[3] [1])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _409_ (
    .C(clk),
    .D(_003_[2]),
    .Q(\contador[3] [2])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _410_ (
    .C(clk),
    .D(_003_[3]),
    .Q(\contador[3] [3])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _411_ (
    .C(clk),
    .D(_003_[4]),
    .Q(\contador[3] [4])
  );
  (* src = "contadores_synth.v:31" *)
  DFF _412_ (
    .C(clk),
    .D(_003_[5]),
    .Q(\contador[3] [5])
  );
  assign i = 32'd4;
endmodule

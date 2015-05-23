open Bc
  
let parse ch = 
  let cu = Lllex.parse ch in

    Bc_manip.process_params cu;

    Bc_manip.assign_block_numbers cu;

    Bc_manip.compute_neighbors cu;

    Bc_manip.compute_cfg_predecessors cu;

    Bc_manip.assign_vartyps cu;

    cu;


    

open Util.Assert
open Hellocaml

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)

let student_tests : suite =
  [
    Test
      ( "Student-Provided Tests For Problem 1-3",
        [
          ("case1", assert_eqf (fun () -> prob3_ans) 17);
          ("case2", assert_eqf (fun () -> prob3_ans - 17) (0));
          ("case3", assert_eqf (fun () -> prob3_case3) 14);
        ] );
    Test
      ( "Student-Provided Tests For Problem 4-3",
        [
          ( "case1",
            assert_eqf
              (fun () ->
                interpret
                  [ ("x", 1L); ("y", 2L); ("z", 3L) ]
                  (Add (Var "x", Mult (Var "y", Neg (Var "z")))))
              (-5L) );
        ] );
  ]

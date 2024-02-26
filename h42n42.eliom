[%%shared
open Eliom_lib
open Eliom_content
open Html.D
]

module H42n42_app =
  Eliom_registration.App (
  struct
    let application_name = "h42n42"
    let global_data_path = None
  end)

let main_service =
  Eliom_service.create
    ~path:(Eliom_service.Path [])
    ~meth:(Eliom_service.Get Eliom_parameter.unit)
    ()

let panel =
  div ~a:[a_class [""]] [
    div ~a:[a_class ["panel"];] [
      div ~a:[ a_class [ "river" ] ] [];
      div ~a:[ a_class [ "hospital" ] ] [];
    ]
  ]

let page =
      body
        [
          div ~a:[a_class [""]] [
            div ~a:[a_class ["title"]] [
              h1 [txt "H42N42"]
            ];
            panel;
            div ~a:[a_class ["button_block"]] [
              button ~a:[a_class ["button"]] [txt "Start"];
            ]
          ];
        ]

let () =
  H42n42_app.register
    ~service:main_service
    (fun () () ->
       Lwt.return
         (Eliom_tools.F.html
            ~title:"h42n42"
            ~css:[["css";"h42n42.css"]]
            page))

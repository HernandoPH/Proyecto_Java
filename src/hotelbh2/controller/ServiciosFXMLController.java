/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelbh2.controller;

import hotelbh2.model.Servicio;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

/**
 * FXML Controller class
 *
 * @author Rusbelth
 */
public class ServiciosFXMLController implements Initializable {
    @FXML TableView<Servicio> tablaServicio;
    //@FXML TableColumn<Servicio, Number> id;
    @FXML TableColumn<Servicio, String> nombreS;
    @FXML TableColumn<Servicio, Number> precio;
    @FXML TableColumn<Servicio, Number> idR;
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) 
    {
        
        ObservableList<Servicio> list = FXCollections.observableArrayList();
        Servicio.lista(list);
        tablaServicio.setItems(list);
        //id.setCellValueFactory(new PropertyValueFactory<Servicio, Number>("id_servicio"));
        nombreS.setCellValueFactory(new PropertyValueFactory<Servicio, String>("nombre_servicio"));
        precio.setCellValueFactory(new PropertyValueFactory<Servicio, Number>("precio"));
        idR.setCellValueFactory(new PropertyValueFactory<Servicio, Number>("reserva"));
    }    
    
}

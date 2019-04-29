/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hotelbh2.controller;

import hotelbh2.model.Reporte;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

/**
 * FXML Controller class
 *
 * @author Rusbelth
 */
public class ListaReporteFXMLController implements Initializable {

    @FXML DatePicker fechaIn;
    @FXML DatePicker fechaFin;
    @FXML TableView<Reporte> tablaReportes;
    @FXML TableColumn<Reporte, String> clmTipo;
    @FXML TableColumn<Reporte, String> clmFecha;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) 
    {
        String fecha1 = CalendarioFXMLController.fechaI;
        String fecha2 = CalendarioFXMLController.fechaF;
        ObservableList<Reporte> reporte = FXCollections.observableArrayList();
        try 
        {
            Reporte.lista(reporte,fecha1,fecha2);
            tablaReportes.setItems(reporte);
            clmTipo.setCellValueFactory(new PropertyValueFactory<Reporte, String>("tipo"));
            clmFecha.setCellValueFactory(new PropertyValueFactory<Reporte, String>("fecha"));
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(ListaReporteFXMLController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }    
    
}

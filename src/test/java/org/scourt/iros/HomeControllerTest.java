package org.scourt.iros;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.scourt.iros.service.OfficerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  "classpath*:spring/context-root.xml" )
@WebAppConfiguration
class HomeControllerTest {
	
	@Inject 
	private DataSource ds;

	@Mock
	OfficerService service;
    @InjectMocks
    private HomeController homeController;
    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
	    MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(homeController).build();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testHome() throws Exception {


		System.out.println("list == > "+ds.getConnection());

		
		//		try {
//			List<OfficerVO> list = service.selectAll();
//			System.out.println("list "+list.size());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//fail("Not yet implemented");
	}

	@Test
	void testSearch() {
		fail("Not yet implemented");
	}

	@Test
	void testAddOfficer() {
		fail("Not yet implemented");
	}

	@Test
	void testModifyOfficer() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteOfficer() {
		fail("Not yet implemented");
	}

}

/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package net;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test void appHasAGreeting() {
        AssetApplication classUnderTest = new AssetApplication();
        assertNotNull(classUnderTest.getGreeting(), "app should have a greeting");
    }
}
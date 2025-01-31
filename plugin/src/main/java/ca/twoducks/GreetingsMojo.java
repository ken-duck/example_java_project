package ca.twoducks;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;
/**
 * Says "Hi" to the user.
 *
 */
@Mojo(name = "sayhi")
public class GreetingsMojo extends AbstractMojo
{
  @Override
  public void execute() throws MojoExecutionException
  {
    getLog().info("Hello, world.");
  }
}

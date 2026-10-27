import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RadioButtonDemo extends JPanel implements ActionListener {

    private static final String[] PETS = {"Bird", "Cat", "Dog", "Rabbit", "Pig"};
    private static final String[] EXTENSIONS = {".png", ".gif", ".jpg"};

    private final JLabel picture = new JLabel();

    public RadioButtonDemo() {
        super(new BorderLayout());

        JPanel radioPanel = new JPanel(new GridLayout(0, 1));
        ButtonGroup group = new ButtonGroup();

        for (String pet : PETS) {
            JRadioButton button = new JRadioButton(pet);
            button.setMnemonic(pet.charAt(0));
            button.setActionCommand(pet);
            button.addActionListener(this);
            group.add(button);
            radioPanel.add(button);

            if (pet.equals("Pig")) {
                button.setSelected(true);
            }
        }

        picture.setHorizontalAlignment(SwingConstants.CENTER);
        updatePicture("Pig");

        add(radioPanel, BorderLayout.LINE_START);
        add(picture, BorderLayout.CENTER);
        setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String pet = e.getActionCommand();
        updatePicture(pet);
        JOptionPane.showMessageDialog(
                this,
                "You selected: " + pet,
                "Pet Selection",
                JOptionPane.INFORMATION_MESSAGE);
    }

    private void updatePicture(String pet) {
        for (String ext : EXTENSIONS) {
            ImageIcon icon = new ImageIcon("images/" + pet + ext);
            if (icon.getIconWidth() > 0) {
                picture.setIcon(icon);
                picture.setText(null);
                return;
            }
        }
        picture.setIcon(null);
        picture.setText(pet + " (image not found in images/ folder)");
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("RadioButtonDemo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setContentPane(new RadioButtonDemo());
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(RadioButtonDemo::createAndShowGUI);
    }
}

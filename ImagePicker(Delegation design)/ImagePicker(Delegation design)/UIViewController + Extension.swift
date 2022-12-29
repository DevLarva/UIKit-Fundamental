//
//  UIViewController + Extension.swift
//  ImagePicker(Delegation design)
//
//  Created by 백대홍 on 2022/12/29.
//

// MARK: - 프리뷰 익스텐션을 만들어줘서 어떤 뷰컨트롤러에서든 쓸 수 있게 만들어줌
import Foundation
import SwiftUI


#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
